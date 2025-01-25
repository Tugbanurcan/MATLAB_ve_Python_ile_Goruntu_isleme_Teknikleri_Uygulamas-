% Görüntünün okunması
I = imread('ip.jpg');

% Görüntünün 30 derece döndürülmesi
rotatedImage = imrotate(I, 30, 'bilinear', 'crop'); % 'bilinear': interpolasyon yöntemi, 'crop': boyutu kırp

% Orijinal ve döndürülmüş görüntünün gösterilmesi
figure;
 
imshow(I);
title('Orijinal Görüntü');

 
