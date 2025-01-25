% Görüntünün okunup double tipine veri dönüşümünün yapılması 
I1 = im2double(imread('cat.jpg')); 
% Filtrelerin oluşturulması 
hx=fspecial('sobel');
w = [1 2 1; 0 0 0; -1 -2 -1];
hy=[1 0 -1; 2 0 -2; 1 0 -1]
%hy=w'
% Filtrelerin uygulanması 
g1=imfilter(I1,h,'replicate');   
g2=imfilter(I1,w,'replicate');
g3=imfilter(I1,hy,'replicate'); 
g4=I1+g1+g3;
% Yeni görüntülerin gösterilmesi 
subplot(2,2,1);
imshow(I1); 
subplot(2,2,2);
imshow(g1);  
subplot(2,2,3);
imshow(g3);
subplot(2,2,4);
imshow(g1+g3);

input('Bir tusa basınız')
close all
