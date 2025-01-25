% Görüntünün okunup double tipine veri dönüşümünün yapılması
I1 = im2double(imread('lena.bmp'));
% Filtrenin oluşturulması
h=fspecial('prewitt');
% Filtrenin uygulanması
I2=imfilter(I1,h,'replicate');
figure,imshow(I2,[]);