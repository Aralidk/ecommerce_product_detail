import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecommerce_product_detail/core/network/shopify_client.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'data/cart_query.dart';
import 'cart_state.dart';

final cartProvider = StateNotifierProvider<CartController, CartState>(
  (ref) => CartController(ref),
);

final shopifyClientProvider = Provider<ShopifyClient>((ref) {
  return ShopifyClient();
});

class CartController extends StateNotifier<CartState> {
  CartController(this.ref) : super(CartState.initial());

  final Ref ref;

  Future<void> addToCart({required String variantId, int quantity = 1}) async {
    // güncelle
    state = state.copyWith(
      isLoading: true,
      totalQuantity: state.totalQuantity + quantity,
    );

    try {
      final client = ref.read(shopifyClientProvider);

      if (state.cartId == null) {
        // sepet oluştur
        final response = await client.query(
          cartCreateMutation,
          variables: {
            'lines': [
              {'merchandiseId': variantId, 'quantity': quantity},
            ],
          },
        );

        final cart = response['cartCreate']['cart'];

        state = state.copyWith(
          cartId: cart['id'] as String,
          totalQuantity: cart['totalQuantity'] as int,
          isLoading: false,
        );
      } else {
        // ekle
        final response = await client.query(
          cartLinesAddMutation,
          variables: {
            'cartId': state.cartId,
            'lines': [
              {'merchandiseId': variantId, 'quantity': quantity},
            ],
          },
        );

        final cart = response['cartLinesAdd']['cart'];
        state = state.copyWith(
          totalQuantity: cart['totalQuantity'] as int,
          isLoading: false,
        );
      }
    } catch (e) {
      state = state.copyWith(
        totalQuantity: state.totalQuantity - quantity,
        isLoading: false,
      );
      rethrow;
    }
  }
}
