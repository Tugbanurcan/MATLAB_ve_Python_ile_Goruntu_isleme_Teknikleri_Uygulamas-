% Görüntüyü yükle
img = imread('woman.jpg');  % Görüntü dosyasını burada değiştirin

% 5x5 Gauss filtresi oluşturma
sigma = 1.0;  % Gauss dağılımının standart sapması
size = 5;  % Filtre boyutu
gauss_filter = fspecial('gaussian', size, sigma);
 

% Netleştirme işlemi (Orijinal renkli görüntüden bulanıklaştırılmış görüntüyü çıkar)
sharpened_img = img + (img - blurred_img);  % Renkli görüntüden bulanıklaştırılmış görüntüyü çıkar

% Sonuçları görselleştir
subplot(1, 2, 1), imshow(img), title('Orijinal Görüntü');
subplot(1, 2, 2), imshow(sharpened_img), title('Netleştirilmiş Görüntü');
