% Görüntünün okunması
I1=imread('circles.png');
% Kernelin hazırlanması
h=ones(5,5);
% Erosion işleminin uygulanması
I2=imerode(I1,h);
% Yeni görüntülerin gösterilmesi
figure;imshow(I1) 
figure; imshow(I2)