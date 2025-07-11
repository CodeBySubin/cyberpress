import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:healthsync/core/network/api_endpoints.dart';

class ApiService {
  static final ApiService _instance = ApiService._internal();
  late final Dio _dio;
  factory ApiService() => _instance;

  ApiService._internal() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiEndpoint.baseUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        headers: {'Content-Type': 'application/json'},
      ),
    );

    _dio.interceptors.add(
      InterceptorsWrapper(
    onRequest: (options, handler) async {
      debugPrint('--- API REQUEST ---');
      debugPrint('METHOD: ${options.method}');
      debugPrint('URL: ${options.baseUrl}${options.path}');
      debugPrint('HEADERS: ${options.headers}');
      debugPrint('QUERY: ${options.queryParameters}');
      debugPrint('BODY: ${options.data}');
      debugPrint('--------------------');
      return handler.next(options);
    },
    onResponse: (response, handler) {
      debugPrint('--- API RESPONSE ---');
      debugPrint('STATUS: ${response.statusCode}');
      debugPrint('URL: ${response.requestOptions.uri}');
      debugPrint('DATA: ${response.data}');
      debugPrint('---------------------');
      return handler.next(response);
    },
    onError: (error, handler) {
      debugPrint('--- API ERROR ---');
      debugPrint('TYPE: ${error.type}');
      debugPrint('MESSAGE: ${error.message}');
      debugPrint('REQUEST: ${error.requestOptions.method} ${error.requestOptions.uri}');
      if (error.response != null) {
        debugPrint('STATUS: ${error.response?.statusCode}');
        debugPrint('DATA: ${error.response?.data}');
      }
    }
      ),
    );
  }

  Dio get dio => _dio;
}
