class Product {
  final String id;
  final String title;
  final String descriptionHtml;
  final String vendor;
  final String description;
  final List<ProductOption> options;
  final List<ProductVariant> variants;
  final List<ProductImage> images;

  Product({
    required this.id,
    required this.title,
    required this.descriptionHtml,
    required this.options,
    required this.variants,
    required this.images, required this.vendor, required this.description,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      vendor: json['vendor'] as String? ?? '',
      description: json['description'] as String? ?? '',
      title: json['title'],
      descriptionHtml: json['descriptionHtml'],
      options: (json['options'] as List)
          .map((e) => ProductOption.fromJson(e))
          .toList(),
      variants: (json['variants']['nodes'] as List)
          .map((e) => ProductVariant.fromJson(e))
          .toList(),
      images: (json['images']['nodes'] as List)
          .map((e) => ProductImage.fromJson(e))
          .toList(),
    );
  }
}

class ProductOption {
  final String id;
  final String name;
  final List<String> values;

  ProductOption({required this.id, required this.name, required this.values});

  factory ProductOption.fromJson(Map<String, dynamic> json) {
    return ProductOption(
      id: json['id'],
      name: json['name'],
      values: List<String>.from(json['values']),
    );
  }
}

class ProductImage {
  final String url;
  final String? altText;

  ProductImage({required this.url, this.altText});

  factory ProductImage.fromJson(Map<String, dynamic> json) {
    return ProductImage(url: json['url'], altText: json['altText']);
  }
}

class SelectedOption {
  final String name;
  final String value;

  SelectedOption({required this.name, required this.value});

  factory SelectedOption.fromJson(Map<String, dynamic> json) {
    return SelectedOption(name: json['name'], value: json['value']);
  }
}

class ProductVariant {
  final String id;
  final bool availableForSale;
  final String price;
  final String currency;
  final List<SelectedOption> selectedOptions;
  final String? imageUrl;

  ProductVariant({
    required this.id,
    required this.availableForSale,
    required this.price,
    required this.currency,
    required this.selectedOptions,
    this.imageUrl,
  });

  factory ProductVariant.fromJson(Map<String, dynamic> json) {
    return ProductVariant(
      id: json['id'],
      availableForSale: json['availableForSale'],
      price: json['price']['amount'],
      currency: json['price']['currencyCode'],
      imageUrl: json['image']?['url'],
      selectedOptions: (json['selectedOptions'] as List)
          .map((e) => SelectedOption.fromJson(e))
          .toList(),
    );
  }
}
