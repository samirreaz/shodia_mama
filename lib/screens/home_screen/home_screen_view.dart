import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:shodia_mama/routs/app_routes.dart';
import 'package:shodia_mama/screens/home_screen/home_screen_controller.dart';

class HomeScreenView extends GetView<HomeScreenController> {
  List x = ['samir', 'reaz'];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ListView.builder(
        itemCount: x.length,
        itemBuilder: (context, index) => ListTile(
          onTap: () {
            Get.toNamed(AppRoutes.DETAIL, arguments: {
              'item': x[index],
            });
          },
          title: Text('001'),
        ),
      ),
    );
  }
}
