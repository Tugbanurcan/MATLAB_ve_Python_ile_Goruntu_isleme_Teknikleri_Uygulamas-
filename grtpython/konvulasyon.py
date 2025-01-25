import cv2
import numpy as np
import matplotlib.pyplot as plt

# Resmi yükle
giris_resmi = cv2.imread("cat.jpg")  # Orijinal renkli resim

# Çekirdek matrisi
matris = [
    [0, -2, 0],
    [-2, 11, -2],
    [0, -2, 0]
]

# Çekirdek boyutu
kernel_size = len(matris)
pad = kernel_size // 2  # Kenarlarda sıfır ekleme miktarı (padding)

# Resmin boyutlarını alın
resim_yuksekligi, resim_genisligi, kanal_sayisi = giris_resmi.shape

# Kenarları sıfırlarla doldur

def pad_image(image, pad, channel):
    padded_image = np.zeros((resim_yuksekligi + 2 * pad, resim_genisligi + 2 * pad), dtype=np.uint8)
    padded_image[pad:pad + resim_yuksekligi, pad:pad + resim_genisligi] = image[:, :, channel]
    return padded_image

# Konvolüsyon işlemini uygula

def apply_convolution(image, kernel):
    output = np.zeros_like(image, dtype=np.uint8)
    for channel in range(kanal_sayisi):
        padded_image = pad_image(image, pad, channel)
        channel_output = np.zeros((resim_yuksekligi, resim_genisligi), dtype=np.uint8)
        for i in range(pad, resim_yuksekligi + pad):
            for j in range(pad, resim_genisligi + pad):
                toplam = 0
                for m in range(kernel_size):
                    for n in range(kernel_size):
                        toplam += padded_image[i - pad + m, j - pad + n] * kernel[m][n]
                # Değerleri [0, 255] aralığına sınırla
                channel_output[i - pad, j - pad] = max(0, min(255, toplam))
        output[:, :, channel] = channel_output
    return output

# Konvolüsyon işlemini uygula
netlestirilmis_resim = apply_convolution(giris_resmi, matris)

# Orijinal ve netleştirilmiş resmi göster
plt.figure(figsize=(10, 5))

plt.subplot(1, 2, 1)
plt.imshow(cv2.cvtColor(giris_resmi, cv2.COLOR_BGR2RGB))
plt.title("Orijinal Resim")
plt.axis("off")

plt.subplot(1, 2, 2)
plt.imshow(cv2.cvtColor(netlestirilmis_resim, cv2.COLOR_BGR2RGB))
plt.title("Konvolüsyon ile Netleştirilmiş Resim")
plt.axis("off")

plt.tight_layout()
plt.show()
