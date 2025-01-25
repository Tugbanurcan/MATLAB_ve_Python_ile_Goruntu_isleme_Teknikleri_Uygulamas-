% Görüntüyü yükle
img = imread('cat.jpg'); % Görüntü dosyasını burada değiştirin

% 9x9 ortalama (mean) filtre matrisini oluştur
mean_filter = ones(9, 9) / 81; % 9x9'luk matris ve toplamı 1 olacak şekilde normalize edilmiştir

% Görüntüyü bir kez bulanıklaştır
blurred_img = imfilter(img, mean_filter, 'replicate'); 

% Aynı filtreyi bir kez daha uygula
blurred_img = imfilter(blurred_img, mean_filter, 'replicate');

% Sonuçları göster
subplot(1,2,1), imshow(img), title('Orijinal Görüntü');
subplot(1,2,2), imshow(blurred_img), title('Daha Fazla Bulanıklaştırılmış Görüntü');