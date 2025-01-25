% Görüntüyü okuma 
img = imread('lena.bmp');  % Görüntü yolunu doğru şekilde belirtin

% Görüntü boyutlarını al
[height, width, ~] = size(img);

% Orijinal resmin uzaklaştırılması (%50)
uzak_bolge = imresize(img, [floor(height * 0.5), floor(width * 0.5)]);

% Görüntülerin gösterilmesi
figure;

% Orijinal görüntü
subplot(1, 2, 1);
imshow(img);
title('Orijinal Görüntü');

% Uzaklaştırılmış görüntü
subplot(1, 2, 2);
imshow(uzak_bolge);
title('Uzaklaştırılmış Görüntü');
