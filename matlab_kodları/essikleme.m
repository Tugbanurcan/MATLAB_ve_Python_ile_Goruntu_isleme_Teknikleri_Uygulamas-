% Görüntünün okunması
I1 = imread('woman.jpg');
% Thresholding seviyesinin belirlenmesi
level = graythresh(I1);
% Thresholdingin uygulanması
bw = im2bw(I1,level);
% Yeni görüntünün gösterilmesi
figure, imshow(bw)