import numpy as np
from PIL import Image
import matplotlib.pyplot as plt
from matplotlib.widgets import Cursor
from typing import List, Tuple

class PerspectiveCorrection:
    def __init__(self, image_path: str):
        """Görüntü yolunu ve varsayılan ayarları kullanarak başlatılır"""
        self.image = Image.open(image_path)  # Görüntüyü aç
        self.img_array = np.array(self.image)  # Görüntüyü numpy dizisine dönüştür
        self.points: List[Tuple[float, float]] = []  # Kullanıcı tarafından seçilen 4 nokta
        self.output_width = 300  # Çıktı görüntüsünün genişliği
        self.output_height = 200  # Çıktı görüntüsünün yüksekliği

    def collect_points(self):
        """Kullanıcının tıklamalarıyla 4 noktayı toplar"""
        fig, ax = plt.subplots(figsize=(10, 8))  # Görüntü için bir figür ve eksen oluştur
        ax.imshow(self.img_array)  # Görüntüyü ekranda göster
        cursor = Cursor(ax, useblit=True, color='red', linewidth=1)  # Kullanıcıyı takip edecek kırmızı bir imleç ekle
        
        def onclick(event):
            """Kullanıcı her tıkladığında nokta ekleyen fonksiyon"""
            if event.xdata is None or event.ydata is None:  # Tıklama alanı geçersizse
                return
            if len(self.points) < 4:  # 4 nokta seçilene kadar devam et
                self.points.append((event.xdata, event.ydata))  # Tıklanan noktayı listeye ekle
                print(f"Nokta {len(self.points)} seçildi: ({event.xdata:.2f}, {event.ydata:.2f})")  # Noktayı yazdır
                plt.plot(event.xdata, event.ydata, 'ro')  # Noktayı kırmızı olarak işaretle
                plt.draw()  # Grafiği güncelle
                if len(self.points) == 4:  # 4 nokta seçildiyse pencereyi kapat
                    plt.close()

        fig.canvas.mpl_connect('button_press_event', onclick)  # Tıklama olayını bağla
        plt.title("Düzeltmek istediğiniz bölgenin 4 köşesini saat yönünde seçin\n(sol üstten başlayarak)")
        plt.show()  # Görüntüyü göster ve etkileşime izin ver
        return len(self.points) == 4  # 4 nokta doğru şekilde seçildiyse True döndür
    
    def compute_transform(self) -> np.ndarray:
        """Perspektif dönüşüm matrisini hesaplar"""
        src_points = np.array(self.points, dtype=np.float32)  # Seçilen 4 nokta
        dst_points = np.array([
            [0, 0],
            [self.output_width - 1, 0],
            [self.output_width - 1, self.output_height - 1],
            [0, self.output_height - 1]
        ], dtype=np.float32)  # Hedef noktalar (çıktı görüntüsünün 4 köşesi)

        A = []  # Dönüşüm matrisini oluşturmak için denklem sistemi
        for i in range(4):
            x, y = src_points[i]
            X, Y = dst_points[i]
            A.append([x, y, 1, 0, 0, 0, -x * X, -y * X])
            A.append([0, 0, 0, x, y, 1, -x * Y, -y * Y]) 
        A = np.array(A)  # Matris A'yı oluştur
        B = dst_points.flatten()  # Hedef noktaların vektörü
        h = np.linalg.lstsq(A, B, rcond=None)[0]  # En küçük kareler yöntemi ile çözüm
        H = np.append(h, 1).reshape(3, 3)  # Perspektif dönüşüm matrisi
        
        return H
    
    def apply_transform(self, H: np.ndarray) -> np.ndarray:
        """Görüntüye perspektif dönüşümünü uygular"""
        output = np.zeros((self.output_height, self.output_width, 3), dtype=np.uint8)  # Çıktı görüntüsünü oluştur
        H_inv = np.linalg.inv(H)  # Dönüşüm matrisinin tersini al
        
        y_coords, x_coords = np.mgrid[0:self.output_height, 0:self.output_width]  # Çıktı görüntüsü için grid oluştur
        coords = np.stack((x_coords.flatten(), y_coords.flatten(), np.ones_like(x_coords.flatten())))        
        src_coords = H_inv.dot(coords)  # Ters dönüşümü uygula
        src_coords = src_coords / src_coords[2]  # Normalizasyon işlemi
        
        src_x = src_coords[0].reshape(self.output_height, self.output_width)
        src_y = src_coords[1].reshape(self.output_height, self.output_width)
        
        valid_mask = (
            (src_x >= 0) & (src_x < self.img_array.shape[1] - 1) & 
            (src_y >= 0) & (src_y < self.img_array.shape[0] - 1)
        )  # Geçerli pikselleri belirle
        
        src_x_0 = np.floor(src_x[valid_mask]).astype(int)
        src_y_0 = np.floor(src_y[valid_mask]).astype(int)
        src_x_1 = src_x_0 + 1
        src_y_1 = src_y_0 + 1
        
        for c in range(3):  # Renk kanalları için her bir renk kanalını işleme
            output[valid_mask, c] = (
                (1 - (src_x[valid_mask] - src_x_0)) * (1 - (src_y[valid_mask] - src_y_0)) * 
                    self.img_array[src_y_0, src_x_0, c] +
                (src_x[valid_mask] - src_x_0) * (1 - (src_y[valid_mask] - src_y_0)) * 
                    self.img_array[src_y_0, src_x_1, c] +
                (1 - (src_x[valid_mask] - src_x_0)) * (src_y[valid_mask] - src_y_0) * 
                    self.img_array[src_y_1, src_x_0, c] +
                (src_x[valid_mask] - src_x_0) * (src_y[valid_mask] - src_y_0) * 
                    self.img_array[src_y_1, src_x_1, c]
            ).astype(np.uint8)
        
        return output

def main():
    """Ana fonksiyon, perspektif düzeltme işlemini başlatır"""
    corrector = PerspectiveCorrection('Plaka.jpg')  # Görüntü yolunu al
    print("Düzeltmek istediğiniz bölgenin 4 köşesini seçin:")
    print("1. Sol üst köşe")
    print("2. Sağ üst köşe")
    print("3. Sağ alt köşe")
    print("4. Sol alt köşe")
    if not corrector.collect_points():  # Kullanıcıdan 4 nokta al
        print("Hata: Lütfen tam olarak 4 nokta seçin")
        return
    
    H = corrector.compute_transform()  # Dönüşüm matrisini hesapla
    output_image = corrector.apply_transform(H)  # Perspektif dönüşümünü uygula
    
    plt.figure(figsize=(10, 8))  # Çıktı görüntüsünü göster
    plt.imshow(output_image)
    plt.title("Perspektifi Düzeltilmiş Görüntü")
    plt.axis('off')
    plt.show()

if __name__ == "__main__":
    main()
