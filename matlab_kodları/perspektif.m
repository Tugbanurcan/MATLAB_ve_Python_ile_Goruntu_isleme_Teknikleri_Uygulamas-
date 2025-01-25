plaka_resmi = imread('Plaka.jpg');
% Kullanıcıdan plakanın dört koseyı al
 figure;
 imshow(plaka_resmi);
 title('Lütfen plakanın dört köşesini sırasıyla seçin');
 [x, y] = ginput(4);
% Seçilen köşeleri orijinal görüntü üzerinde işaretle
 hold on; 
plot(x, y, 'ro-', 'LineWidth', 2); 
hold off;
% Hedef köşe koordinatlarını tanımlayın 
% Düzleştirilmiş plaka için bir boyut belirliyoruz 
plaka_genislik = 400; 
plaka_yukseklik = 100; 
hedef_koordinatlar = [
 0, 0; 
plaka_genislik, 0; 
plaka_genislik, plaka_yukseklik;
 0, plaka_yukseklik 
];
% Perspektif dönüşüm matrisini hesapla
orijinal_koordinatlar = [x, y];
tform = fitgeotrans(orijinal_koordinatlar, hedef_koordinatlar, 'projective');
% Perspektif dönüşümü uygula 
duzeltilmis_plaka = imwarp(plaka_resmi, tform, 'OutputView', imref2d([plaka_yukseklik, plaka_genislik]));
% Sonuçları görselleştir 
figure; subplot(1,2,1); imshow(plaka_resmi); title('Orijinal Resim');
subplot(1,2,2); imshow(duzeltilmis_plaka); title('Düzeltilmiş Perspektif');
