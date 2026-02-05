import 'model/product_model.dart';

class ProductDetailState {
  final bool isLoading;
  final String? errorMessage;
  final Product? product;
  final Map<String, String> selectedOptions;
  final ProductVariant? selectedVariant;

  const ProductDetailState({
    required this.isLoading,
    this.errorMessage,
    this.product,
    this.selectedOptions = const {},
    this.selectedVariant,
  });

  factory ProductDetailState.initial() {
    return const ProductDetailState(isLoading: true);
  }

  ProductDetailState copyWith({
    bool? isLoading,
    String? errorMessage,
    Product? product,
    Map<String, String>? selectedOptions,
    ProductVariant? selectedVariant,
  }) {
    return ProductDetailState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      product: product ?? this.product,
      selectedOptions: selectedOptions ?? this.selectedOptions,
      selectedVariant: selectedVariant ?? this.selectedVariant,
    );
  }
}
