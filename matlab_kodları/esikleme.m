%goruntuyu okuma
img = imread('kalem.png');
%gri tonlu 
grayImg = rgb2gray(img);
%esikleme belirleme
level = graythresh(grayImg);
%esikleme uygulama
newImg = imbinarize(grayImg,level);
%ekran ciktisi
figure;
subplot(1,2,1);
imshow(grayImg);
title('Gri ton');
subplot(1,2,2);
imshow(newImg);
title('esiklenmis goruntu');


