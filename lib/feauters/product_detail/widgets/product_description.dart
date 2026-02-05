import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({super.key, required this.descriptionHtml});

  final String descriptionHtml;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ExpansionTile(
        title: const Text(
          'Ürün Açıklaması',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(8),
        ),
        childrenPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 8,
        ),
        iconColor: Colors.black,
        collapsedIconColor: Colors.green,

        children: [
          Html(
            data: descriptionHtml,
            style: {
              'body': Style(
                margin: Margins.zero,
                padding: HtmlPaddings.zero,
                fontSize: FontSize(14),
                color: Colors.black87,
              ),
            },
          ),
        ],
      ),
    );
  }
}
