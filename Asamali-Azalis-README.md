


# Aşamalı Azalış Animasyonu



---

### **Aşamalı Azalış Nedir?**
**Aşamalı azalış (gradient descent)**, bir fonksiyonun minimum değerini bulmak için kullanılan bir optimizasyon algoritmasıdır. Bu yöntem, hata fonksiyonunu küçültmek ve modelin doğruluğunu artırmak için gradyanın ters yönünde iteratif olarak ilerler. Makine öğreniminde, özellikle parametrelerin optimizasyonu için yaygın olarak kullanılır.

---

### **Doğrusal Regresyon Nedir?**
**Doğrusal regresyon**, bağımlı bir değişken (hedef) ile bir veya daha fazla bağımsız değişken (özellik) arasındaki ilişkiyi modellemek için kullanılan istatistiksel bir yöntemdir. Bu yöntem, veriler arasındaki doğrusal ilişkiyi varsayar ve aşağıdaki denklemle tanımlanır:  

\[
y = \theta_0 + \theta_1 \cdot x
\]

Doğrusal regresyon; ekonomi, biyoloji ve makine öğrenimi gibi alanlarda eğilimleri tahmin etmek, ilişkileri analiz etmek ve verileri modellemek için kullanılır.

---

### **Bu Teknikler Neden Kullanılır?**
- **Aşamalı Azalış**: Modeldeki hatayı azaltmak için en uygun parametreleri (eğim ve sabit) bulmaya yardımcı olur.  
- **Doğrusal Regresyon**: Girdilere dayalı olarak tahmin yapmak veya eğilimleri analiz etmek için basit ve anlaşılır bir yöntem sunar.

---

### **Adım Adım Rehber**

#### **Adım 1: Ortamı Hazırlayın**
Gerekli kütüphaneleri yükleyip veriyi tanımlıyoruz:
```R
library(ggplot2)
library(gifski)

set.seed(123)
x <- iris$Sepal.Length  # Bağımsız değişken
y <- iris$Petal.Length  # Bağımlı değişken
```

#### **Adım 2: Gradient Descent Fonksiyonu**
Bu fonksiyon, maliyet fonksiyonunu hesaplar ve animasyon için regresyon çizgisi katsayılarını kaydeder:
```R
gradient_descent_animation <- function(x, y, alpha = 0.01, num_iterations = 1000) {
  # Fonksiyonun gövdesi (önceden sağlanan kodla aynı)
}
```

#### **Adım 3: Maliyet Fonksiyonunu Görselleştirin**
Maliyet fonksiyonu, hatanın iterasyonlara göre nasıl azaldığını gösterir:
```R
results <- gradient_descent_animation(x, y, alpha = 0.01, num_iterations = 1000)
plot(1:1000, results$cost_history, type = "l", xlab = "Iterasyon", ylab = "Maliyet")
```

#### **Adım 4: Animasyonu Oluşturun**
Her iterasyon için kareler oluşturup bunları bir GIF'e birleştiriyoruz:
```R
png_files <- sprintf("frame%03d.png", 1:32)
iters <- seq(1, 1000, length.out = 32)

for (i in 1:length(iters)) {
  # Animasyon karelerini oluştur
}
gifski(png_files, gif_file = "gradient_descent_animation.gif", delay = 0.4)
unlink(png_files)
```
