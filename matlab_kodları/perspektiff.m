plaka_gorseli = imread('Plaka.jpg');

% Kullanıcıdan plakanın dört köşe noktasını seçmesini iste
figure;
imshow(plaka_gorseli);
title('plakanın dört köşesini sırasıyla seçin');
[x_koordinat, y_koordinat] = ginput(4);

% Seçilen köşe noktalarını orijinal görsel üzerinde işaretle
hold on;
plot(x_koordinat, y_koordinat, 'ro-', 'LineWidth', 2);
hold off;

% Düzleştirilmiş plaka için hedef köşe koordinatlarını tanımla
% Bu hedef, plakanın düzleştirilmiş haline göre belirlediğimiz yeni boyutları içeriyor
hedef_genislik = 400; % Hedef genişlik
hedef_yukseklik = 100; % Hedef yükseklik
hedef_koordinatlar = [
    0, 0; % Sol üst köşe
    hedef_genislik, 0; % Sağ üst köşe
    hedef_genislik, hedef_yukseklik; % Sağ alt köşe
    0, hedef_yukseklik % Sol alt köşe
];

% Seçilen orijinal köşe koordinatları ile hedef koordinatlar arasındaki
% perspektif dönüşüm matrisini hesapla
giris_koordinat = [x_koordinat, y_koordinat];
perspektif_donusum = fitgeotrans(giris_koordinat, hedef_koordinatlar, 'projective');

% Hesaplanan perspektif dönüşümünü kullanarak plakanın düzleştirilmiş
% versiyonunu oluştur
duzeltilmis_plaka_gorseli = imwarp(plaka_gorseli, perspektif_donusum, 'OutputView', imref2d([hedef_yukseklik, hedef_genislik]));

% Sonuçları görselleştir
figure;
subplot(1,2,1); % Orijinal resmi sol tarafta göster
imshow(plaka_gorseli);
title('Orijinal Resim');

subplot(1,2,2); % Düzeltilmiş resmi sağ tarafta göster
imshow(duzeltilmis_plaka_gorseli);
title('Düzeltilmiş Perspektif');
