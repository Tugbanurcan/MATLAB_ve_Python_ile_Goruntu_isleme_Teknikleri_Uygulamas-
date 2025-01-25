import cv2 
import numpy as np 
import matplotlib.pyplot as plt 

# Görsellerin gri tonlamalı olarak okunması
main_image = cv2.imread('matkap.jpg', cv2.IMREAD_GRAYSCALE)  # Ana görüntü 
drill_tip_image = cv2.imread('saglam_matkap.jpg', cv2.IMREAD_GRAYSCALE)  # Şablon görüntü (matkap ucu)

# Normalleştirilmiş çapraz korelasyon işlemi (manuel hesaplama)
def normalized_cross_correlation(template, image): 
    # Şablon ve ana görüntü boyutlarını al
    template_height, template_width = template.shape 
    image_height, image_width = image.shape 

    # Çıkış korelasyon matrisi oluştur
    correlation_matrix = np.zeros((image_height - template_height + 1, image_width - template_width + 1)) 

    # Şablonun ortalamasını ve standart sapmasını hesapla
    template_mean = np.mean(template) 
    template_std = np.std(template) 

    # Şablonu normalize et
    normalized_template = (template - template_mean) / template_std 

    # Görüntü üzerinde her bir konum için çapraz korelasyonu hesapla
    for i in range(correlation_matrix.shape[0]): 
        for j in range(correlation_matrix.shape[1]): 
            # Şablon boyutunda bir bölge seç
            region = image[i:i + template_height, j:j + template_width] 
            # Bölgenin ortalama ve standart sapmasını hesapla
            region_mean = np.mean(region) 
            region_std = np.std(region) 

            # Eğer bölgenin standart sapması sıfır değilse, normalize et ve korelasyonu hesapla
            if region_std != 0: 
                normalized_region = (region - region_mean) / region_std 
                correlation_matrix[i, j] = np.sum(normalized_template * normalized_region) 

    return correlation_matrix 

# Şablon ile ana görüntü arasındaki çapraz korelasyonu hesapla
correlation_result = normalized_cross_correlation(drill_tip_image, main_image) 

# Korelasyon sonucunda en yüksek değeri ve konumunu bul
max_correlation = np.max(correlation_result) 
max_index = np.unravel_index(np.argmax(correlation_result), correlation_result.shape) 
top_y, top_x = max_index 

# Şablonun ana görüntüdeki konumunu belirle
drill_tip_height, drill_tip_width = drill_tip_image.shape 
top_left_x = top_x 
top_left_y = top_y 

# Ana görüntü üzerine tespit edilen bölgeyi dikdörtgenle çiz
plt.figure() 
plt.imshow(main_image, cmap='gray') 
plt.title('Sağlam Matkap Ucu Tespit Edildi') 
plt.axis('off') 
rectangle = plt.Rectangle((top_left_x, top_left_y), drill_tip_width, drill_tip_height, edgecolor='r', linewidth=2, fill=False) 
plt.gca().add_patch(rectangle) 
plt.show() 

# Tespit edilen sonuçları yazdır
print(f"En yüksek korelasyon değeri: {max_correlation:.2f}") 
print(f"Matkap ucu sol üst köşesi: (X: {top_left_x}, Y: {top_left_y})")