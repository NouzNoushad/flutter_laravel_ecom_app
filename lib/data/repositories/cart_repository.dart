import 'dart:convert';

import 'package:ecom_app_bloc/data/models/cart_add_request.dart';
import 'package:ecom_app_bloc/data/models/cart_response.dart';
import 'package:ecom_app_bloc/data/repositories/base_client.dart';
import 'package:flutter/material.dart';

import '../../utils/end_points.dart';

class CartRepository {
  BaseClient baseClient = BaseClient();

  Future<dynamic> addToCart(
      {required CartAddRequestModel cartAddRequestModel}) async {
    String uri = '$baseUrl/${EndPoints.addCart}';
    debugPrint('///////////// cart model: $cartAddRequestModel');
    var response = await baseClient.postRequest(
      uri,
      cartAddRequestModelToJson(cartAddRequestModel),
    );
    debugPrint(
        '///////////// cart response: ${jsonDecode(response)['result']}');
    return jsonDecode(response)['result'];
  }

  Future<CartResponseModel> getCartProducts() async {
    String uri = '$baseUrl/${EndPoints.getCarts}';
    var response = await baseClient.getRequest(uri);
    CartResponseModel cartResponseModel = cartResponseModelFromJson(response);
    debugPrint('///////////// get cart response: $cartResponseModel');
    return cartResponseModel;
  }

  Future<dynamic> deleteCart({required int id}) async {
    String uri = '$baseUrl/${EndPoints.deleteCart}';
    var response = await baseClient.postRequest(
      uri,
      jsonEncode({'id': id}),
    );
    debugPrint(
        '///////////// cart delete response: ${jsonDecode(response)['result']}');
    return jsonDecode(response)['result'];
  }
}
