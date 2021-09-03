import 'dart:convert';

import 'package:dio/dio.dart';

import '../blocs/bloc_central.dart';

/// this main service will provide the managment of http request using som package

class ServiceHttp {
  /// This class acts like main bloc of users module
  /// Singleton pattern
  static final ServiceHttp _serviceHttp = ServiceHttp._internal();

  factory ServiceHttp() => _serviceHttp;

  ServiceHttp._internal() {
    /// All of initial checks will be here and
    /// will be executed once
  }

  Future<Map<String, dynamic>> jsonGetRequestHttp(
      {required String url, Map<String, String> parameters = const {}}) async {
    Map<String, dynamic> tmpMap = {};
    final dio = Dio();
    try {
      /// BlocCentral is singleton class we wouldn't a new instance Here
      if (BlocCentral().validateUrl(url)) {
        final response = await dio.get(url, queryParameters: parameters);
        if (response.data.runtimeType == String) {
          tmpMap = jsonDecode(response.data);
        } else if (response.data is Map<String, dynamic>) {
          tmpMap = response.data;
        }
      }
    } catch (e) {
      tmpMap = {};
    }
    return tmpMap;
  }

  Future<Map<String, dynamic>> jsonPostRequestHttp(
      {required String url, Map<String, dynamic> parameters = const {}}) async {
    Map<String, dynamic> tmpMap = {};
    final dio = Dio();
    try {
      /// BlocCentral is singleton class we wouldn't a new instance Here
      if (BlocCentral().validateUrl(url)) {
        final response = await dio.post(url, queryParameters: parameters);
        if (response.data.runtimeType == String) {
          tmpMap = jsonDecode(response.data);
        }
        if (response.data is Map<String, dynamic>) {
          tmpMap = response.data;
        }
      }
    } catch (e) {
      tmpMap = {};
    }
    return tmpMap;
  }
}
