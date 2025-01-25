% Orijinal görüntünün yüklenmesi
I = imread('lena.bmp');  

% Görüntünün aynalanması (düşey eksende ters çevirme)
I_mirrored = fliplr(I); % Sütunlar ters çevrilir, sağ ve sol yer değiştirir.

% Görüntülerin gösterilmesi
figure;
subplot(1, 2, 1), imshow(I), title('Orijinal Görüntü');
subplot(1, 2, 2), imshow(I_mirrored), title('Aynalanmış Görüntü (Düşey Eksende)');

