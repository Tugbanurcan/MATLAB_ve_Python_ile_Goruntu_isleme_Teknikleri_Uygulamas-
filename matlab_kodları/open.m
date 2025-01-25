 % Görüntünün okunması
I1 = imread('circles.png');
% Kernelin hazırlanması
se = strel('disk',5);
% Açma işleminin uygulanması
I2 = imopen(I1,se);
% Yeni görüntülerin gösterilmesi
figure;imshow(I1) 
figure; imshow(I2)