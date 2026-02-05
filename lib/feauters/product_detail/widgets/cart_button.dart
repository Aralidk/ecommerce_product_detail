import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/service/snackbar_service.dart';
import '../../cart/cart_controller.dart';
import '../product_detail_state.dart';

class CartButton extends ConsumerWidget {
  const CartButton({super.key, required this.state});

  final ProductDetailState state;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartState = ref.watch(cartProvider);

    final isEnabled =
        state.selectedVariant?.availableForSale == true && !cartState.isLoading;

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(52),
            backgroundColor: Colors.black,
            disabledBackgroundColor: Colors.grey.shade400,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: isEnabled
              ? () async {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  try {
                    await ref
                        .read(cartProvider.notifier)
                        .addToCart(variantId: state.selectedVariant!.id);
                    SnackBarService.showSuccess(context, 'Sepete eklendi!');
                  } catch (_) {
                    SnackBarService.showError(context, 'Sepete eklenemedi');
                  }
                }
              : null,
          child: cartState.isLoading
              ? const SizedBox(
                  height: 22,
                  width: 22,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Sepete Ekle',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 6),
                    Icon(
                      Icons.add_shopping_cart,
                      color: Colors.white,
                      size: 24,
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
