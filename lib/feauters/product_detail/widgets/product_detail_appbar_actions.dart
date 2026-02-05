import 'package:flutter/material.dart';
import '../../cart/cart_state.dart';

class ProductDetailActions extends StatelessWidget {
  const ProductDetailActions({
    super.key,
    required this.cartState,
  });
  final CartState cartState;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Stack(
        alignment: Alignment.center,
        children: [
          const Icon(Icons.shopping_cart,color: Colors.black,size: 32,),
          ///sepet ürün adet
          if (cartState.totalQuantity > 0)
            Positioned(
              right: 6,
              top: 6,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(12),
                ),
                constraints: const BoxConstraints(
                  minWidth: 16,
                  minHeight: 16,
                ),
                child: Text(
                  '${cartState.totalQuantity}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
        ],
      ),
    );
  }
}