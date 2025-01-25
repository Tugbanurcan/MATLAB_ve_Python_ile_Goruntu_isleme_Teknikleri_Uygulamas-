% Görüntünün okunup double tipine veri dönüşümünün yapılması
I1 = im2double(imread('nar.jpg'));
% Filtrenin oluşturulması
g=fspecial('average',10)
% Filtrenin uygulanması
I2=imfilter(I1,g,'replicate');
figure,imshow(I2,[]);