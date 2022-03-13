import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:shodia_mama/models/product_model.dart';
import 'package:shodia_mama/service/api_status.dart';
import 'package:shodia_mama/utils/constrants.dart';

import 'http_service.dart';
import 'package:http/http.dart' as http;

class HttpServiceImplementation {
  /* static Future<Object> getProductsData() async {
    try {
      var url = Uri.parse(PRODUCT_URL);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        return Success(
            code: 200,
            response: ProductModel.fromJson(json.decode(response.body)));
      }
      return Failure(
          code: USER_INVALID_RESPONSE, errorResponse: 'Invalid Response');
    } on HttpException {
      return Failure(
          code: NO_INTERNET, errorResponse: 'No Internet Connection');
    } on FormatException {
      return Failure(code: INVALID_FORMAT, errorResponse: 'Invalid Format');
    } catch (e) {
      return Failure(code: UNKNOWN_ERROR, errorResponse: 'Unknown Error');
    }
  } */

  Future<List<ProductModel>> fetchProductsData() async {
    List<ProductModel> productList = [];
    try {
      var response = await http.get(Uri.parse(PRODUCT_URL));
      var data = jsonDecode(response.body.toString());
      if (response.statusCode == 200) {
        for (Map i in data) {
          productList.add(ProductModel.fromJson(i));
        }
        //debugPrint('Product List: $productList');
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
