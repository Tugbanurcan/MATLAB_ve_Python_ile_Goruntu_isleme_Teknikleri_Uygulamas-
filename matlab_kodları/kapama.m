% Görüntünün okunması
I1 = imread('circles.png');
% Kernelin hazırlanması
se = strel('disk',10);
% Kapama işleminin uygulanması
I2 = imclose(I1,se);
% Yeni görüntülerin gösterilmesi
figure;imshow(I1) 
figure; imshow(I2)