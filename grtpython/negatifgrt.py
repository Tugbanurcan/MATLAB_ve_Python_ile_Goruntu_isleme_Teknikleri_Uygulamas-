import cv2
import os

# 1. Görüntü dosya yolunun doğru şekilde tanımlanması
file_path = r'C:\Users\tugba\OneDrive\Masaüstü\grtpython\kalem.png'

# 2. Dosyanın varlığını kontrol et
if not os.path.exists(file_path):
    print(f"Dosya bulunamadı: {file_path}. Lütfen dosya yolunu kontrol edin.")
    exit()
else:
    print("Dosya mevcut ve okunabilir.")

# 3. Görüntünün OpenCV tarafından okunup okunmadığını kontrol et
I1 = cv2.imread(file_path)
if I1 is None:
    print(f"Görüntü okunamadı: {file_path}. OpenCV bu dosyayı işleyemiyor.")
    exit()
else:
    print("Görüntü başarıyla okundu.")

# 4. Görüntünün negatifinin oluşturulması
I2 = cv2.bitwise_not(I1)

# 5. Yan yana görüntüleme için görüntülerin birleştirilmesi
yan_yana = cv2.hconcat([I1, I2])

# 6. Görüntüyü göstermek
try:
    cv2.imshow('Orijinal ve Negatif Görüntü', yan_yana)
    cv2.waitKey(0)
    cv2.destroyAllWindows()
except Exception as e:
    print("Görüntü gösterilirken bir hata oluştu:", str(e))

# 7. Negatif görüntünün kaydedilmesi (imshow sorun çıkarırsa)
output_path = r'C:\Users\tugba\OneDrive\Masaüstü\grtpython\negatif_kalem.png'
cv2.imwrite(output_path, I2)
print(f"Negatif görüntü {output_path} konumuna kaydedildi.")
