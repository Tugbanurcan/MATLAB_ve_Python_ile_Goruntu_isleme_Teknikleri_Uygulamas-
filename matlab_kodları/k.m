% Görüntünün okunup double tipine veri dönüşümünün yapılması
I1 = im2double(imread('lena.bmp'));

% Düşey Sobel filtresinin oluşturulması
h_dikey = fspecial('sobel');

% Yatay Sobel filtresinin oluşturulması
h_yatay = h_dikey';

% Düşey Sobel filtresinin uygulanması
I2_dikey = imfilter(I1, h_dikey, 'replicate');

% Yatay Sobel filtresinin uygulanması
I2_yatay = imfilter(I1, h_yatay, 'replicate');

% Sonuçların gösterilmesi
figure, imshow(I2_dikey, []), title('Düşey Sobel Filtresi');
figure, imshow(I2_yatay, []), title('Yatay Sobel Filtresi');
imshow(I1)