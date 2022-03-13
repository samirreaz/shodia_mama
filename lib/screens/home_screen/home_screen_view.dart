import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:shodia_mama/routs/app_routes.dart';
import 'package:shodia_mama/screens/home_screen/home_screen_controller.dart';
import 'package:shodia_mama/utils/size_config.dart';

class HomeScreenView extends GetView<HomeScreenController> {
  @override
  Widget build(BuildContext context) {
    //! it's for responsive design
    SizeConfig().init(context);

    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        child: GetX<HomeScreenController>(builder: (data) {
          if (!controller.isLoaded.value) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Loading...',
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(fontSize: getProportionateScreenWidth(20)),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                CircularProgressIndicator(),
              ],
            );
          }
          return SafeArea(
            child: ListView.builder(
              itemCount: controller.dataList.length,
              itemBuilder: (context, index) => Card(
                child: ListTile(
                  onTap: () {
                    Get.toNamed(AppRoutes.DETAIL,
                        arguments: {'item': data.dataList[index]});
                  },
                  title: Text(data.dataList[index].id),
                  subtitle: Text(data.dataList[index].author),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
