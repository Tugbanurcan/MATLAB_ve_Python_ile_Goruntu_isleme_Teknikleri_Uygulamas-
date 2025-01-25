 % Görüntünün okunması
I1 = imread('ip.jpg');
% Görüntünün verilen açı kadar çevrilmesi
I2 = imrotate(I1,35,'bilinear');
% Yeni görüntünün gösterilmesi
figure, imshow(I2)
% Görüntünün verilen açı kadar çevrilmesi
I3 = imrotate(I1,180,'bicubic');
figure, imshow(I3)