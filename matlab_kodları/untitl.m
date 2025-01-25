% Orijinal görüntünün yüklenmesi
orjinalresim = imread('kadin.jpg');

% Seçilen bölgenin koordinatları: [sol üst x, sol üst y, genişlik, yükseklik]
secilibolge = [300, 300, 200, 200]; 

% Seçilen bölgenin kesilmesi
yakinlastirilmisbolge = imcrop(orjinalresim, secilibolge);

% Kesilen bölgenin boyutunun büyütülmesi (yaklaşık %200 büyütme)
yakinlastirilmisbolge_buyutulmus = imresize(yakinlastirilmisbolge, 2);

% Görüntülerin gösterilmesi
figure;
subplot(1, 2, 1);
imshow(orjinalresim);
title('Orjinal Görüntü');

subplot(1, 2, 2);
imshow(yakinlastirilmisbolge_buyutulmus);
title('Yakınlaştırılmış Görüntü');
% Orijinal görüntünün yüklenmesi
orjinalresim = imread('kadin.jpg');

% Seçilen bölgenin koordinatları: [sol üst x, sol üst y, genişlik, yükseklik]
secilibolge = [300, 300, 200, 200]; 

% Seçilen bölgenin kesilmesi
yakinlastirilmisbolge = imcrop(orjinalresim, secilibolge);

% Kesilen bölgenin boyutunun büyütülmesi (yaklaşık %200 büyütme)
yakinlastirilmisbolge_buyutulmus = imresize(yakinlastirilmisbolge, 2);

% Görüntülerin gösterilmesi
figure;
subplot(1, 2, 1);
imshow(orjinalresim);
title('Orjinal Görüntü');

subplot(1, 2, 2);
imshow(yakinlastirilmisbolge_buyutulmus);
title('Yakınlaştırılmış Görüntü');
