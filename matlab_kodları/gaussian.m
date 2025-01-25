% Görüntünün okunup double tipine veri dönüşümünün yapılması
I1 = im2double(imread('nar.jpg'));
% Filtrenin oluşturulması
h=fspecial('gaussian',10,2)
% Filtrenin uygulanması
I2=imfilter(I1,h,'replicate');
figure,imshow(I2,[]);