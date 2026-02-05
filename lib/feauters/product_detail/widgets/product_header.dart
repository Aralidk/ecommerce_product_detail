import 'package:flutter/material.dart';

class ProductHeader extends StatelessWidget {
  const ProductHeader({
    super.key,
    required this.vendor,
    required this.title,
    required this.shortDescription,
    required this.price,
    required this.currency,
  });

  final String vendor;
  final String title;
  final String shortDescription;
  final String price;
  final String currency;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// marka
          Text(
            vendor.toUpperCase(),
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.black54,
              letterSpacing: 1,
            ),
          ),

          const SizedBox(height: 4),

          /// title
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(width: 6),
              Expanded(
                flex: 1,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      price,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      currency,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),

          /// kısa açıklama
          if (shortDescription.isNotEmpty)
            Text(
              shortDescription,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 14, color: Colors.black54),
            ),

          /// fiyat
        ],
      ),
    );
  }
}
