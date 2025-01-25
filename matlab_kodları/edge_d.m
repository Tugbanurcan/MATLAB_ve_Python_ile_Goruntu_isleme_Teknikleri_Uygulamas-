function edge_detection(input_image)
    % Giriş resmini yükle
    GirisResmi = imread(input_image);
    
    % Resmin boyutlarını al
    [ResimYuksekligi, ResimGenisligi, ~] = size(GirisResmi);
    
    % Çıktı resmi için boş bir matris oluştur
    CikisResmi = zeros(ResimYuksekligi, ResimGenisligi, 3, 'uint8');
    
    % Şablon (çekirdek matris) tanımla
    Matris = [0, -2, 0; -2, 11, -2; 0, -2, 0];
    MatrisToplami = sum(Matris(:)); % Matris elemanlarının toplamı
    
    % Resmin her pikseli için şablon uygulama (sınırlar hariç)
    for x = 2:ResimGenisligi-1
        for y = 2:ResimYuksekligi-1
            % Renk bileşenlerini sıfırlama
            toplamR = 0;
            toplamG = 0;
            toplamB = 0;
            
            % Şablon bölgesi içindeki pikselleri tarama
            k = 1; % Matrisin elemanlarını sırayla okumak için
            for i = -1:1
                for j = -1:1
                    % Şablon bölgesindeki pikselin rengini al
                    OkunanRenk = GirisResmi(y + j, x + i, :);
                    % Renk bileşenlerine şablonu uygula
                    toplamR = toplamR + OkunanRenk(1) * Matris(k);
                    toplamG = toplamG + OkunanRenk(2) * Matris(k);
                    toplamB = toplamB + OkunanRenk(3) * Matris(k);
                    k = k + 1;
                end
            end
            
            % Yeni renk değerlerini hesapla
            R = toplamR / MatrisToplami;
            G = toplamG / MatrisToplami;
            B = toplamB / MatrisToplami;
            
            % Renklerin sınırlarını kontrol et (0-255 arası)
            R = min(max(R, 0), 255);
            G = min(max(G, 0), 255);
            B = min(max(B, 0), 255);
            
            % Çıktı resmine yeni renk değerini yerleştir
            CikisResmi(y, x, 1) = R;
            CikisResmi(y, x, 2) = G;
            CikisResmi(y, x, 3) = B;
        end
    end
    
    % Sonuç resmi görüntüle
    imshow(CikisResmi);
end
