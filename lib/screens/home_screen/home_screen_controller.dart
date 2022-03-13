import 'package:get/get.dart';
import 'package:shodia_mama/models/product_model.dart';
import 'package:shodia_mama/service/http_service_imp.dart';

import '../../service/api_status.dart';

class HomeScreenController extends GetxController {
  RxList<ProductModel> dataList = <ProductModel>[].obs;
  var isLoaded = false.obs;

  loadData() async {
    var allData = await HttpServiceImplementation().fetchProductsData();

    if (allData != null) {
      dataList.value = allData;
      isLoaded.value = true;
    } else {
      return null;
    }
  }

  @override
  void onInit() async {
    super.onInit();
    loadData();
    print('products');
  }
}
