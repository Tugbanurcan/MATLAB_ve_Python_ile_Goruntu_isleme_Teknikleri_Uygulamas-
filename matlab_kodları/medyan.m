% Görüntünün okunması
I1 = imread('womann.jpg');
% Resmi gri tonlamaya çevirme
I1_gray = rgb2gray(I1);
% Resim üzerinde siyah beyaz noktaların oluşturulması
I2 = imnoise(I1_gray, 'salt & pepper', 0.02);
% Filtrenin uygulanması
I3 = medfilt2(I2);
% Yeni görüntülerin gösterilmesi
imshow(I2)
figure, imshow(I3)
 
