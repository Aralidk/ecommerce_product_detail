# ecommerce_product_detail

## E-Commerce Product Detail Page

Bu proje, Shopify Storefront GraphQL API kullanılarak geliştirilmiş bir **Ürün Detay Sayfası** case study uygulamasıdır.  
Flutter ve Riverpod kullanılarak ölçeklenebilir, okunabilir ve modern bir mimari hedeflenmiştir.

---

```text

## ✨ Özellikler

- Shopify Storefront GraphQL API üzerinden ürün detaylarını çekme
- Ürün görselleri için:
  - Yatay kaydırılabilir PageView
  - Dot indicator
  - Görsel sayısı göstergesi (1 / N)
  - Sol / sağ kaydırma yönünü belirten ikonlar
- Ürün varyant ve opsiyon seçimi
- Seçilen varyanta göre dinamik fiyat güncelleme
- Sepete ekleme akışı:
  - Optimistic UI
  - Loading durumu
  - Hata yönetimi
- Global cart state ve AppBar’da canlı sepet badge
- Merkezi SnackBar geri bildirim sistemi

---

## 📁 Proje Yapısı


lib/
├─ app/
│  └─ app.dart                 # Uygulama başlangıcı
├─ core/
│  ├─ const/                   # Sabitler
│  ├─ network/                 # Shopify client (Dio)
│  └─ service/                 # UI servisleri (SnackBar)
├─ features/
│  ├─ product_detail/
│  │  ├─ data/
│  │  │  ├─ product_repository.dart
│  │  │  └─ product_query.dart
│  │  ├─ model/
│  │  ├─ widgets/
│  │  ├─ product_detail_controller.dart
│  │  ├─ product_detail_state.dart
│  │  └─ product_detail_page.dart
│  └─ cart/
│     ├─ data/
│     │ └─ cart_query.dart
│     ├─ cart_controller.dart
│     └─ cart_state.dart
└─ main.dart



Mimari Kararlar
Riverpod (StateNotifier) ile ölçeklenebilir state yönetimi
Network ve data erişimi için Repository Pattern
Controller’lar yalnızca state orkestrasyonu yapar
UI geri bildirimleri (SnackBar) core katmanında soyutlanmıştır
UI bileşenleri küçük ve yeniden kullanılabilir widget’lara ayrılmıştır

🧠State Yönetimi
flutter_riverpod ^3.2.1
Ürün detayı ve sepet state’leri birbirinden bağımsız yönetilir
Sepete ekleme işlemi sonrası AppBar badge otomatik güncellenir
Optimistic UI sayesinde kullanıcıya anlık geri bildirim sağlanır

🌐API Entegrasyonu
Shopify Storefront GraphQL API
Network işlemleri Dio ile yapılır
GraphQL query ve mutation’lar ayrı dosyalarda tanımlanmıştır
Repository katmanında hata ve null kontrolleri yapılır


📱Kullanılan Teknolojiler
Flutter: 3.36.0-1.0.pre-372 (master channel)
Dart: 3.10.0-158.0.dev
State Management: flutter_riverpod
Networking: dio
JSON Parsing: json_annotation
UI: Material Design

Bağımlılıklar
flutter_riverpod: ^3.2.1
dio: ^5.9.1
json_annotation: ^4.10.0
flutter_html: ^3.0.0
riverpod: ^3.2.1


▶️ Çalıştırma Adımları
Gereksinimler
Flutter SDK (master channel)
Xcode
iOS Simulator
Adımlar
gh repo clone Aralidk/ecommerce_product_detail
flutter pub get
flutter run

👩‍💻 Geliştirici
Dilara Kuzey
Flutter / Yazılım Mühendisi

