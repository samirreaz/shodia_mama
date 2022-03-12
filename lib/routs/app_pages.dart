import 'package:get/get.dart';
import 'package:shodia_mama/routs/app_routes.dart';
import 'package:shodia_mama/screens/detail_screen/detail_screen_binding.dart';
import 'package:shodia_mama/screens/detail_screen/detail_screen_view.dart';
import 'package:shodia_mama/screens/home_screen/home_screen_binding.dart';
import 'package:shodia_mama/screens/home_screen/home_screen_view.dart';

class AppPage {
  static var list = [
    GetPage(
      name: AppRoutes.HOME,
      page: () => HomeScreenView(),
      binding: HomeScreenBinding(),
    ),
    GetPage(
      name: AppRoutes.DETAIL,
      page: () => DetailScreenView(),
      binding: DetailScreenBinding(),
    ),
  ];
}
