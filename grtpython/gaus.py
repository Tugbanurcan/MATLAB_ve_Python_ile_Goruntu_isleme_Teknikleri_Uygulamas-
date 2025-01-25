import cv2

# Görüntünün renkli olarak okunması
I1 = cv2.imread('C:/Users/tugba/OneDrive/Masaüstü/grtpython/nar.jpg')

# Görüntü dosyasının başarıyla yüklendiğini kontrol et
if I1 is None:
    print("Görüntü yüklenemedi. Dosya yolunu kontrol edin.")
    exit()

# 10x10 boyutunda ve sigma=2 olan Gaussian filtresinin oluşturulması
h = cv2.getGaussianKernel(10, 2)
h = h @ h.T  # 2D Gaussian filtresi oluşturuluyor

# Renkli görüntüye Gaussian filtresinin uygulanması
I2 = cv2.filter2D(I1, -1, h)

# Yeni görüntünün gösterilmesi
cv2.imshow('Gaussian Filtered Image', I2)
cv2.waitKey(0)  # Görüntüyü kapatmak için bir tuşa basmayı bekler
cv2.destroyAllWindows()  # Tüm pencereleri kapatır
