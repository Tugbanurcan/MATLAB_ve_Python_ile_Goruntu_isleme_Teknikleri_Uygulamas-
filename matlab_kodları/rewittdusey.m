% Görüntünün okunup double tipine veri dönüşümünün yapılması
I1 = im2double(imread('lena.bmp'));

% Filtrenin oluşturulması
h = fspecial('prewitt');

% Filtrenin uygulanması (Düşey filtre için)
I2 = imfilter(I1, h', 'replicate'); % Transpoz alındı
figure, imshow(I2, []), title('Düşey Prewitt Filtresi');
