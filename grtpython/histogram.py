def gri_tonlama_ve_histogram(dosya_yolu):
    # Görüntünün dosyadan okunması
    try:
        with open(dosya_yolu, 'rb') as f:
            data = f.read()

        # Görüntünün gri tonlamaya çevrildiği mesajı
        print("Görüntü başarıyla okundu ve gri tonlama işlemi için işleniyor...")

        # Bu kısımda görüntü işleme ve histogram hesaplama adımları eklenebilir.
        # Örneğin, her pikselin parlaklık değerlerini işleyebilirsiniz.
    except FileNotFoundError:
        print(f"Hata: Dosya '{dosya_yolu}' bulunamadı.")
    except Exception as e:
        print(f"Beklenmeyen bir hata oluştu: {e}")

# Fonksiyonu çağırma
gri_tonlama_ve_histogram(r'C:\Users\tugba\OneDrive\Masaüstü\grtpython\kalem.png')
