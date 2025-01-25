% Görüntüyü yükle
img = imread('cat.jpg');  % Görüntü dosyasını buraya ekleyin
img = im2double(img);    % Görüntüyü double formata dönüştürme

% 5x5 Gauss çekirdeği oluşturma
sigma = 1;  % Standart sapma değeri
filter_size = 5;
[x, y] = meshgrid(-floor(filter_size/2):floor(filter_size/2), -floor(filter_size/2):floor(filter_size/2));
gauss_filter = exp(-(x.^2 + y.^2) / (2 * sigma^2));
gauss_filter = gauss_filter / sum(gauss_filter(:));  % Normalize etme

% Görüntüye Gauss filtresi uygulama
blurred_img = imfilter(img, gauss_filter, 'same');

% Keskinleştirilmiş görüntüyü elde etme
sharpened_img = img + (img - blurred_img);

% Sonuçları gösterme
figure;
subplot(1, 2, 1), imshow(img), title('Orijinal Görüntü');
 
subplot(1, 2, 2), imshow(sharpened_img), title('Netleştirilmiş Görüntü');