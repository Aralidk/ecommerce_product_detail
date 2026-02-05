import 'package:ecommerce_product_detail/feauters/product_detail/data/product_query.dart';
import '../../../../core/network/shopify_client.dart';
import '../model/product_model.dart';

class ProductRepository {
  ProductRepository(this._client);

  final ShopifyClient _client;

  ///ürün title ile tek ürün bilgisi fetch
  Future<Product> getProductByHandle(String handle) async {
    final data = await _client.query(
      productDetailQuery,
      variables: {'handle': handle},
    );
    final productJson = data['productByHandle'];
    if (productJson == null) {
      throw Exception('Product not found');
    }
    return Product.fromJson(productJson);
  }
}
