% Görüntünün okunması
I1 = imread('kadin.jpg');

% Görüntünün yeniden boyutlandırılması
I2 = imresize(I1, [150 50]);

% Görüntülerin yan yana gösterilmesi
figure;
subplot(1, 2, 1); % 1 satır, 2 sütun, 1. konum
imshow(I1);
title('Orijinal Görüntü');

subplot(1, 2, 2); % 1 satır, 2 sütun, 2. konum
imshow(I2);
title('Yeniden Boyutlandırılmış Görüntü');
