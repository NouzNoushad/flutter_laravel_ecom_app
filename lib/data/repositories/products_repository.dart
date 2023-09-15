import 'package:ecom_app_bloc/data/models/products_response.dart';
import 'package:ecom_app_bloc/data/repositories/base_client.dart';
import 'package:ecom_app_bloc/utils/end_points.dart';
import 'package:flutter/material.dart';

class ProductsRepository {
  BaseClient baseClient = BaseClient();
  Future<List<Result>> getProducts() async {
    String uri = '$baseUrl/${EndPoints.products}';
    String response = await baseClient.getRequest(uri);
    ProductsResponseModel responseModel =
        productsResponseModelFromJson(response);
    List<Result> results = responseModel.result;
    return results;
  }

  List<String> getCategories(List<Result> results) {
    List<String> categories =
        results.map((element) => element.category).toSet().toList();
    debugPrint('//////////////// categories: $categories');
    return categories;
  }

  List<Result> productCategories(List<Result> results, String category) {
    List<Result> products = results
        .where((element) =>
            element.category.toLowerCase() == category.toLowerCase())
        .toList();
    for (var e in products) {
      print(e.title);
    }
    return products;
  }
}
