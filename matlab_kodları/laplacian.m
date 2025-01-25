% Görüntünün okunup double tipine veri dönüşümünün yapılması 
I1 = im2double(imread('cat.jpg')); 
% Filtrelerin oluşturulması 
w4=fspecial('laplacian',0);  
w8 = [1 1 1; 1 -8 1; 1 1 1]; 
% Filtrelerin uygulanması 
g=imfilter(I1,w4,'replicate');   
g4=I1-imfilter(I1,w4,'replicate'); 
g8=I1-imfilter(I1,w8,'replicate'); 
% Yeni görüntülerin gösterilmesi 
 
imshow(I1); 
 
imshow(g);  
 
imshow(g4);
 
imshow(g8);
 
 