import cv2
import matplotlib.pyplot as plt
import numpy as np

def apply_mean_filter_manual_color(image, kernel_size):
    # Pad işlemi (kenarlarda taşmayı önlemek için)
    pad_h = kernel_size // 2
    pad_w = kernel_size // 2
    padded_image = np.pad(image, ((pad_h, pad_h), (pad_w, pad_w), (0, 0)), mode='constant', constant_values=0)

    # Çıkış görüntüsü
    filtered_image = np.zeros_like(image, dtype=np.uint8)

    # Ortalama (mean) filtre kernel oluşturma
    kernel = np.ones((kernel_size, kernel_size), dtype=np.float32) / (kernel_size**2)

    # Her kanal için filtreleme
    for c in range(3):  # Renk kanalları (B, G, R)
        for i in range(image.shape[0]):
            for j in range(image.shape[1]):
                region = padded_image[i:i+kernel_size, j:j+kernel_size, c]
                filtered_value = np.sum(region * kernel)
                filtered_image[i, j, c] = min(255, max(0, int(filtered_value)))  # Piksel değerlerini sınırla

    return filtered_image

def display_original_and_filtered(original, filtered):
    # Görüntüleri yan yana göster
    plt.subplot(1, 2, 1)
    plt.imshow(cv2.cvtColor(original, cv2.COLOR_BGR2RGB))
    plt.title('Original Image')
    plt.axis('off')

    plt.subplot(1, 2, 2)
    plt.imshow(cv2.cvtColor(filtered, cv2.COLOR_BGR2RGB))
    plt.title('Mean Filtered Image')
    plt.axis('off')

    plt.show()

# Kullanım
image_path = 'nar.jpg'
original_image = cv2.imread(image_path)  # OpenCV kullanılarak görüntüyü oku

# Ortalama filtreyi renkli görüntüye uygula
kernel_size = 5
filtered_image_color = apply_mean_filter_manual_color(original_image, kernel_size)

# Görüntüleri göster
display_original_and_filtered(original_image, filtered_image_color)
