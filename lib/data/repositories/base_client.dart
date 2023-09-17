import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../config/exceptions.dart';

class BaseClient {
  Client baseClient = Client();
  int timeoutDuration = 30;
  Map<String, String> headers = {'Content-Type': 'application/json'};

  Future<String> getRequest(String uri) async {
    try {
      Uri url = Uri.parse(uri);
      final response = await baseClient
          .get(
            url,
            headers: headers,
          )
          .timeout(Duration(seconds: timeoutDuration));
      if (response.statusCode == 200) {
        debugPrint(
            '////////////////////=>>>>>>>>>>> response: ${response.body}');
        return response.body;
      } else {
        _handleExceptions(response);
      }
    } on SocketException {
      throw FetchDataException(message: 'No internet connection');
    } on TimeoutException {
      throw ApiNotRespondingException(message: 'Api not responding');
    }
    throw Exception('Unable to perform request!');
  }

  Future<String> postRequest(String uri,
      [Object? queryParams]) async {
    try {
      Uri url = Uri.parse(uri);
      final response = await baseClient
          .post(url, body: queryParams, headers: headers)
          .timeout(Duration(seconds: timeoutDuration));
      if (response.statusCode == 200) {
        debugPrint(
            '////////////////////=>>>>>>>>>>> response: ${response.body}');
        return response.body;
      } else {
        _handleExceptions(response);
      }
    } on SocketException {
      throw FetchDataException(message: 'No internet connection');
    } on TimeoutException {
      throw ApiNotRespondingException(message: 'Api not responding');
    }
    throw Exception('Unable to perform request!');
  }

  _handleExceptions(Response response) {
    switch (response.statusCode) {
      case 300:
      case 400:
        throw BadRequestException(
            message: "Unable to perform request!",
            url: response.request?.url.toString());
      case 401:
      case 403:
        throw UnAuthorizedException(
            message: utf8.decode(response.bodyBytes),
            url: response.request?.url.toString());
      case 500:
      default:
        throw FetchDataException(
            message: 'Error occurred with code : ${response.statusCode}',
            url: response.request?.url.toString());
    }
  }
}
