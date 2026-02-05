import 'package:dio/dio.dart';
import 'package:ecommerce_product_detail/core/const/app_const.dart';

class ShopifyClient {
  ShopifyClient()
    : _dio = Dio(
        BaseOptions(
          baseUrl: '$shopUrl/api/2026-01',
          headers: {
            'Content-Type': 'application/json',
            'X-Shopify-Storefront-Access-Token': shopifyToken,
          },
        ),
      );

  final Dio _dio;

  Future<Map<String, dynamic>> query(
    String query, {
    Map<String, dynamic>? variables,
  }) async {
    final response = await _dio.post(
      '/graphql.json',
      data: {'query': query, 'variables': variables ?? {}},
    );

    final data = response.data as Map<String, dynamic>;

    if (data['errors'] != null) {
      throw Exception(data['errors']);
    }

    return data['data'] as Map<String, dynamic>;
  }
}
