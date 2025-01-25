% Görüntünün okunması
I1 = imread('kadin.jpg');
% E:fonksiyon eğimi kontrolü, 10 olarak alınmış.
% m: Seçilen açık-koyu renk arası değer, 150 olarak seçtik.
% eps: Matlab sabiti
m=150; E=10;
% Matlab kontrast germe fonksiyonu
g=1./(1+(m./double(I1)+eps).^E);
% Yeni görüntünün gösterilmesi
figure,imshow(g);