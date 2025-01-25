from PIL import Image

def griye_cevir_ve_goster(kalem, kaydetme_yolu):
    
    original_gorsel = Image.open(kalem)
    
    # Görüntünün RGB formatında gri tonlamaya dönüştürülmesi
    griye_dondurme = original_gorsel.convert("L")
    
    # Gri tonlamalı görüntünün belirtilen yola kaydedilmesi
    griye_dondurme.save(kaydetme_yolu)
    
    # Gri tonlamalı görüntünün gösterilmesi
    griye_dondurme.show()
 
goruntu_yolu = r'C:\Users\tugba\OneDrive\Masaüstü\grtpython\kalem.png'
 
kayit_yolu = r'C:\Users\tugba\OneDrive\Masaüstü\grtpython\kalem_gri.png'

griye_cevir_ve_goster(goruntu_yolu, kayit_yolu)

 