import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:shodia_mama/models/product_model.dart';
import 'package:shodia_mama/screens/home_screen/home_screen_controller.dart';
import 'package:shodia_mama/service/api_status.dart';
import 'package:shodia_mama/utils/constrants.dart';

import 'http_service.dart';
import 'package:http/http.dart' as http;

class HttpServiceImplementation {
  List<ProductModel> productList = [];
  Future<List<ProductModel>> fetchProductsData({bool isRefresh = false}) async {
    try {
      if (isRefresh) {
        HomeScreenController.currentPage = 1;
      }

      var response = await http.get(Uri.parse(
          'https://picsum.photos/v2/list?page=${HomeScreenController.currentPage}&limit=20'));
      var data = jsonDecode(response.body.toString());
      if (response.statusCode == 200) {
        if (isRefresh) {
          for (Map i in data) {
            productList.add(ProductModel.fromJson(i));
          }
        } else {
          List<ProductModel> temp = [];
          for (Map i in data) {
            temp.add(ProductModel.fromJson(i));
          }
          //print("temp" + temp.length.toString());
          //productList = productList + temp;
          productList.addAll(temp);
        }
        //debugPrint("product" + productList.length.toString());
        //debugPrint('Product List: $productList');
        HomeScreenController.currentPage++;
        //debugPrint(HomeScreenController.currentPage.toString());
        return productList;
      } else {
        debugPrint('Error in fetching data');
        return productList;
      }
    } on HttpException {
      debugPrint('No Internet Connection');
      return productList;
    } on FormatException {
      debugPrint('Invalid Format');
      return productList;
    } catch (e) {
      debugPrint('Unknown Error');
      return productList;
    }
  }
}
