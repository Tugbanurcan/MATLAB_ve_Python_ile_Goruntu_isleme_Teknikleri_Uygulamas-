% Orijinal görüntünün yüklenmesi
I = imread('ip.jpg'); % Görüntü dosyanızın adı 'lena.bmp' olmalıdır

% Görüntünün ters çevrilmesi
I_flipped = flipud(fliplr(I)); % Hem yatay hem dikey eksende ters çevirme

% Görüntülerin gösterilmesi
figure;
imshow(I), title('Orijinal Görüntü');
 
