% Görüntünün okunması
I1 = imread('kadin.jpg');
% Histogram eşitlemenin uygulanması
I2 = histeq(I1);
% Histogram eşitlenmiş görüntü
figure, imshow(I2)
% Yeni görüntünün histogramı
figure; imhist(I2)