import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shodia_mama/screens/detail_screen/detail_screen_controller.dart';
import 'package:shodia_mama/utils/size_config.dart';
import 'package:url_launcher/link.dart';

class DetailScreenView extends GetView<DetailScreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Screen"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.network(
                    controller.selectedProduct.downloadUrl,
                    height: getProportionateScreenHeight(250),
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: getProportionateScreenHeight(10),
                      ),
                      Text('Author: ${controller.selectedProduct.author}',
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(
                                  fontSize: getProportionateScreenWidth(20))),
                      SizedBox(
                        height: getProportionateScreenHeight(20),
                      ),
                      Text(
                        'Click URL',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      Link(
                        target: LinkTarget.blank,
                        uri: Uri.parse(controller.selectedProduct.url),
                        builder: (context, followLink) => GestureDetector(
                          child: Text(
                            controller.selectedProduct.url,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(
                                    fontSize: getProportionateScreenWidth(18),
                                    color: Colors.blue,
                                    decoration: TextDecoration.underline),
                          ),
                          onTap: followLink,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
