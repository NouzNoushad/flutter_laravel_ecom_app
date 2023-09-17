import 'dart:convert';

import 'package:ecom_app_bloc/data/models/sign_up_request.dart';
import 'package:ecom_app_bloc/data/repositories/base_client.dart';
import 'package:flutter/material.dart';

import '../../utils/end_points.dart';
import '../models/login_request.dart';

class AuthRepository {
  BaseClient baseClient = BaseClient();
  Future<dynamic> signUpUser(
      {required SignUpRequestModel signUpRequestModel}) async {
    String uri = '$baseUrl/${EndPoints.signUp}';
    var response = await baseClient.postRequest(
      uri,
      signUpRequestModelToJson(signUpRequestModel),
    );
    debugPrint(
        '///////////// sign up response: ${jsonDecode(response)['result']}');
    return jsonDecode(response)['result'];
  }

  Future<dynamic> loginUser(
      {required LoginRequestModel loginRequestModel}) async {
    String uri = '$baseUrl/${EndPoints.login}';
    debugPrint(
        '///////////// sign up response: ${loginRequestModelToJson(loginRequestModel)}');
    var response = await baseClient.postRequest(
      uri,
      loginRequestModelToJson(loginRequestModel),
    );
    debugPrint(
        '///////////// sign up response: ${jsonDecode(response)['result']}');
    return jsonDecode(response)['result'];
  }
}
