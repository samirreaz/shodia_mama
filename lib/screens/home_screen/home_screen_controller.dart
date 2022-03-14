import 'package:get/get.dart';
import 'package:shodia_mama/models/product_model.dart';
import 'package:shodia_mama/service/http_service_imp.dart';

import '../../service/api_status.dart';

class HomeScreenController extends GetxController {
  RxList<ProductModel> dataList = <ProductModel>[].obs;
  var isLoaded = false.obs;
  static int currentPage = 1;
  // it's not the proper way to do it but it's just for the demo
  static int totalPage = 34;

  Future<bool> loadData({bool isRefresh = false}) async {
    var allData = await HttpServiceImplementation()
        .fetchProductsData(isRefresh: isRefresh);

    if (allData != null) {
      dataList.value = allData;
      isLoaded.value = true;
      return true;
    } else {
      return false;
    }
  }

  /* @override
  void onInit() async {
    super.onInit();
    loadData();
    print('products');
  } */
}
