import 'package:dio/dio.dart';
import '../const/app_const.dart';


class ShopifyGraphQLClient {
  ShopifyGraphQLClient(this._dio);

  final Dio _dio;

  Future<Map<String, dynamic>> query(String query, {Map<String, dynamic>? variables}) async {
    final res = await _dio.post(
      '/api/2024-07/graphql.json',
      data: {'query': query, 'variables': variables ?? {}},
      options: Options(headers: {
        'X-Shopify-Storefront-Access-Token': shopifyToken,
        'Content-Type': 'application/json',
      }),
    );

    final data = res.data as Map<String, dynamic>;
    if (data['errors'] != null) {
      throw Exception(data['errors'].toString());
    }
    return data['data'] as Map<String, dynamic>;
  }
}
