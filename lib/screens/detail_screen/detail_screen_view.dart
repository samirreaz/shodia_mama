import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:shodia_mama/screens/detail_screen/detail_screen_controller.dart';

class DetailScreenView extends GetView<DetailScreenController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Screen"),
      ),
      body: Center(
        child: Text(controller.selectedProduct),
      ),
    );
  }
}
