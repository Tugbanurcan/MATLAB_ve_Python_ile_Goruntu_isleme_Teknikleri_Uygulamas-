orjinalresim = imread('woman.jpg'); 
griresim = rgb2gray(orjinalresim);
yeni_min = 0.3; 
yeni_max = 0.7;  
kontrastliresim = imadjust(griresim, [min(griresim(:))/255, max(griresim(:))/255], [yeni_min, yeni_max]);
figure; subplot(1, 2, 1); imshow(griresim); title(' Gri Görüntü');
subplot(1, 2, 2); imshow(kontrastliresim); title('Kontrast Ayarlanmış Görüntü');
