% Görüntünün okunması
I1 = imread('cat.jpg');

% Görüntünün uzaklaştırılması
I2 = imresize(I1, 0.5); % Görüntüyü yarıya küçült

% İlk görüntünün gösterilmesi
figure1 = figure; imshow(I1);
truesize(figure1); % İlk figure penceresinin boyutunu sabit tut

% Uzaklaştırılmış görüntünün gösterilmesi
figure2 = figure; imshow(I2);
truesize(figure2); % İkinci figure penceresinin boyutunu sabit tut