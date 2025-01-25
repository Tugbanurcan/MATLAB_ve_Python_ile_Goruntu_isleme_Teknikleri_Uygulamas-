 resim = imread('Metin.jpg');

mask = [0 1 0; 1 1 1; 0 1 0];

resim_dialation = imdilate(resim, mask);

resim_erozyon = imerode(resim, mask);

figure;
subplot(1, 1, 1);
imshow(resim);
title('Normal Görüntü');

figure;
subplot(1, 1, 1);
imshow(resim_dialation);
title('Yaymalı Görüntü');

figure;
subplot(1, 1, 1);
imshow(resim_erozyon);
title('Erozyonlu Görüntü');