import 'package:ecommerce_product_detail/feauters/product_detail/widgets/product_description.dart';
import 'package:ecommerce_product_detail/feauters/product_detail/widgets/product_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../product_detail_controller.dart';
import '../product_detail_page.dart';
import 'options.dart';

class Content extends ConsumerWidget {
  const Content(this.productHandle, {super.key});
  final String productHandle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(productDetailProvider(productHandle));
    final product = state.product!;
    final selectedVariant = state.selectedVariant!;
    final selectedOptions = state.selectedOptions;
    final imageUrls = selectedVariant.imageUrl != null
        ? [selectedVariant.imageUrl!]
        : product.images.map((e) => e.url).toList();

    return ListView(
      padding: const EdgeInsets.only(bottom: 90),
      children: [
        _ImageCarousel(productHandle: productHandle, imageUrls: imageUrls),
        ProductHeader(
          vendor: product.vendor,
          title: product.title,
          shortDescription: product.description,
          price: selectedVariant.price,
          currency: selectedVariant.currency,
        ),
        VariantOptions(
          productHandle: productHandle,
          options: product.options,
          selectedOptions: selectedOptions,
        ),
        Divider(),
        ProductDescription(descriptionHtml: product.descriptionHtml),
      ],
    );
  }
}

/// pageview
class _ImageCarousel extends ConsumerWidget {
  const _ImageCarousel({required this.productHandle, required this.imageUrls});

  final String productHandle;
  final List<String> imageUrls;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageIndex = ref.watch(productImagePageIndexProvider(productHandle));

    return Column(
      children: [
        SizedBox(
          height: 320,
          child: Stack(
            alignment: Alignment.center,
            children: [
              PageView.builder(
                controller: PageController(viewportFraction: 0.92),
                itemCount: imageUrls.length,
                onPageChanged: (index) {
                  ref
                          .read(
                            productImagePageIndexProvider(
                              productHandle,
                            ).notifier,
                          )
                          .state =
                      index;
                },
                itemBuilder: (_, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.08),
                          blurRadius: 12,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(imageUrls[index], fit: BoxFit.cover),
                    ),
                  );
                },
              ),

              const Positioned(
                left: 8,
                child: Icon(Icons.chevron_left, size: 32),
              ),

              const Positioned(
                right: 8,
                child: Icon(Icons.chevron_right, size: 32),
              ),
            ],
          ),
        ),

        const SizedBox(height: 8),

        _ImageIndicator(current: pageIndex, total: imageUrls.length),
      ],
    );
  }
}

/// adet indicator
class _ImageIndicator extends StatelessWidget {
  const _ImageIndicator({required this.current, required this.total});

  final int current;
  final int total;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: List.generate(
            total,
            (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: current == index ? 16 : 6,
              height: 6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: current == index ? Colors.black : Colors.black26,
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          '${current + 1} / $total',
          style: const TextStyle(fontSize: 12, color: Colors.black54),
        ),
      ],
    );
  }
}

