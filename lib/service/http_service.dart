import 'package:shodia_mama/models/product_model.dart';

abstract class HttpService {
  void initService();
  Future<ProductModel> getProduct(String url);
}
