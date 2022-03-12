import 'package:get/get.dart';

import 'detail_screen_controller.dart';

class DetailScreenBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<DetailScreenController>(() => DetailScreenController());
  }

}