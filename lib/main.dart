import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shodia_mama/routs/app_pages.dart';
import 'package:shodia_mama/routs/app_routes.dart';
import 'package:shodia_mama/theme/theme_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: themeData(),
      //home: ,
      initialRoute: AppRoutes.HOME,
      getPages: AppPage.list,
    );
  }
}
