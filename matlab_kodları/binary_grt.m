% Renkli bir görüntü okuma
I = imread('catt.jpg');

% Gri tonlamaya çevirme
I_gray = rgb2gray(I);

% Eşikleme (binary) işlemi
threshold = 100; % 100 eşik değeri
I_binary = imbinarize(I_gray, threshold / 255); % 0-1 arası normalizasyon

% Sonuçları gösterme
imshow(I_binary);
title('İkili Görüntü');
