I1 = imread('woman.jpg');
min_val = double(min(I1(:)));
max_val = double(max(I1(:)));
I2 = (double(I1) - min_val) * (255 / (max_val - min_val));
figure;
subplot(1,2,1); imshow(I1); title('Orijinal Görüntü');
subplot(1,2,2); imshow(uint8(I2)); title('Kontrast Gerilmis Görüntü');
