% Görüntünün okunması
I1=imread('Metin.jpg');
% Kernelin hazırlanması
h=[0 1 0;1 1 1;0 1 0];
% Dialation işleminin uygulanması
I2=imdilate(I1,h);
% Yeni görüntülerin gösterilmesi
imshow(I1) ;figure, imshow(I2)