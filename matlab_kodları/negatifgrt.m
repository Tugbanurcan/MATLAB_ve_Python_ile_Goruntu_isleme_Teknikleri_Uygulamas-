% Görüntünün okunması
I1 = imread('woman.jpg');
% Görüntünün negatifinin oluşturulması
I2 = imcomplement(I1);
% Yeni görüntünün gösterilmesi
imshow(I2);