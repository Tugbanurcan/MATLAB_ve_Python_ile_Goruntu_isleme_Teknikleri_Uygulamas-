% Orijinal görüntünün yüklenmesi
I = imread('ip.jpg'); % Görüntü dosyanızın adı 'lena.bmp' olmalıdır

% Öteleme vektörünün tanımlanması (x ve y yönünde)
dx = 350; % Yatay yönde 50 piksel sağa kaydırma
dy = 300; % Dikey yönde 30 piksel aşağı kaydırma

% Görüntünün ötelenmesi
I_translated = imtranslate(I, [dx, dy]);

% Görüntülerin gösterilmesi
figure;
subplot(1, 2, 1), imshow(I), title('Orijinal Görüntü');
subplot(1, 2, 2), imshow(I_translated), title('Ötelenmiş Görüntü');
