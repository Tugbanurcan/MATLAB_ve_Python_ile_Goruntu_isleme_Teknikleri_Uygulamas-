% Giriş resmini yükleyin
GirisResmi = imread('cat.jpg'); % Kendi resim dosyanız ile değiştirin

% Resmin boyutlarını alın
[ResimYuksekligi, ResimGenisligi, ~] = size(GirisResmi);

% Çekirdek matrisi (3x3)
Matris = [0, -2, 0; -2, 11, -2; 0, -2, 0];

% Çekirdek matrisi ile konvolüsyon uygulayın
% Renkli resim üzerinde işlemi yapıyoruz
CikisResmiR = GirisResmi(:,:,1); % Kırmızı kanal
CikisResmiG = GirisResmi(:,:,2); % Yeşil kanal
CikisResmiB = GirisResmi(:,:,3); % Mavi kanal

CikisResmiR = uint8(conv2(double(CikisResmiR), Matris, 'same'));
CikisResmiG = uint8(conv2(double(CikisResmiG), Matris, 'same'));
CikisResmiB = uint8(conv2(double(CikisResmiB), Matris, 'same'));

% Piksel değerlerini [0, 255] aralığına sıkıştırın
CikisResmiR(CikisResmiR > 255) = 255;
CikisResmiR(CikisResmiR < 0) = 0;

CikisResmiG(CikisResmiG > 255) = 255;
CikisResmiG(CikisResmiG < 0) = 0;

CikisResmiB(CikisResmiB > 255) = 255;
CikisResmiB(CikisResmiB < 0) = 0;

% Netleştirilmiş resmi yeniden birleştirin
CikisResmi = cat(3, CikisResmiR, CikisResmiG, CikisResmiB);

% Orijinal ve netleştirilmiş resmi yan yana görselleştirin
figure;
subplot(1, 2, 1);
imshow(GirisResmi);
title('Orijinal Resim');

subplot(1, 2, 2);
imshow(CikisResmi);
title('Konvolüsyon ile Netleştirilmiş Resim');
