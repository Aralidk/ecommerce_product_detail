import 'package:ecommerce_product_detail/feauters/product_detail/data/product_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'product_detail_state.dart';
import '../../../core/network/shopify_client.dart';

final productRepositoryProvider = Provider<ProductRepository>((ref) {
  return ProductRepository(ShopifyClient());
});

final productDetailProvider = StateNotifierProvider.autoDispose
    .family<ProductDetailController, ProductDetailState, String>(
      (ref, handle) => ProductDetailController(ref, handle),
    );

class ProductDetailController extends StateNotifier<ProductDetailState> {
  ProductDetailController(this.ref, this.handle)
    : super(ProductDetailState.initial()) {
    _init();
  }

  final Ref ref;
  final String handle;

  Future<void> _init() async {
    try {
      final product = await ref
          .read(productRepositoryProvider)
          .getProductByHandle(handle);
      final defaultOptions = {
        for (final o in product.variants.first.selectedOptions) o.name: o.value,
      };

      state = state.copyWith(
        isLoading: false,
        product: product,
        selectedOptions: defaultOptions,
        selectedVariant: product.variants.first,
        errorMessage: null,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }

  ///ürün varyantı seçme
  void selectOption(String optionName, String value) {
    final updated = Map<String, String>.from(state.selectedOptions);
    updated[optionName] = value;

    final variant = state.product!.variants.firstWhere(
      (v) => v.selectedOptions.every((o) => updated[o.name] == o.value),
    );
    state = state.copyWith(selectedOptions: updated, selectedVariant: variant);
  }
}
