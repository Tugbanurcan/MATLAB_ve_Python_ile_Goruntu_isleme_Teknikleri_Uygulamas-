% Görüntünün okunup double tipine veri dönüşümünün yapılması
I1 = im2double(imread('nar.jpg'));
% 2x2 ve 5x5 filtrelerin oluşturulması
w1=ones(2); w2=ones(5);
% Filtrelerin uygulanması
I2 = imfilter(I1,w1,'replicate'); I3 = imfilter(I1,w2,'replicate');
% Yeni görüntülerin gösterilmesi
figure, imshow(I2,[]);  
figure, imshow(I3,[]);
figure, imshow(I1,[]);