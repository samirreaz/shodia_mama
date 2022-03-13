import 'package:get/get.dart';
import 'package:shodia_mama/models/product_model.dart';

class DetailScreenController extends GetxController {
  ProductModel selectedProduct = Get.arguments['item'];
}
