import 'package:ecommerce_product_detail/feauters/product_detail/product_detail_controller.dart';
import 'package:ecommerce_product_detail/feauters/product_detail/widgets/cart_button.dart';
import 'package:ecommerce_product_detail/feauters/product_detail/widgets/content.dart';
import 'package:ecommerce_product_detail/feauters/product_detail/widgets/product_detail_appbar_actions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import '../cart/cart_controller.dart';

final productImagePageIndexProvider = StateProvider.family<int, String>(
  (ref, handle) => 0,
);

class ProductDetailPage extends ConsumerWidget {
  const ProductDetailPage({super.key, required this.productHandle});
  final String productHandle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(productDetailProvider(productHandle));
    final cartState = ref.watch(cartProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Ürün Detay',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        actions: [ProductDetailActions(cartState: cartState)],
      ),
      body: ProductDetailBody(productHandle: productHandle),
      floatingActionButton: CartButton(state: state),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class ProductDetailBody extends ConsumerWidget {
  const ProductDetailBody({super.key, required this.productHandle});
  final String productHandle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(productDetailProvider(productHandle));

    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.errorMessage != null) {
      return Center(
        child: Text(
          state.errorMessage!,
          style: const TextStyle(color: Colors.red),
        ),
      );
    }
    return Content(productHandle);
  }
}
