import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/data/core/helpers/constant_helper.dart';

import 'dio_interceptor.dart';

class DioHelper {
  static Dio? dio;

  static void initialDio(String baseUrl) async {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 2),
        receiveTimeout: const Duration(seconds: 2),
        contentType: 'application/json',
        responseType: ResponseType.json,
      ),
    );
  }

  static void setDioLogger(String baseUrl) async {
    dio!.interceptors.add(
      InterceptorsWrapper(
        onResponse: (response, responseInterceptorHandler) {
          debugPrint('${response.statusCode} - ${response.data.toString()}\n');
          if (response.statusCode == 401) {
            // Get.offAll(() => SignInPage());
          }
          return responseInterceptorHandler.next(response);
        },
        onRequest: (request, requestInterceptorHandler) {
          debugPrint('${request.method} - ${request.path} - ${request.data}');
          request.headers.addAll({
            HttpHeaders.authorizationHeader:
                'Bearer ${ConstantHelper.BEARER_TOKEN}'
          });
          return requestInterceptorHandler.next(request);
        },
        onError: (DioError error, errorInterceptor) {
          debugPrint(error.message);
          return errorInterceptor.next(error);
        },
      ),
    );
  }

  static setDioHeader(String? token) {
    dio?.options.headers = {
      HttpHeaders.authorizationHeader: 'Bearer ${ConstantHelper.BEARER_TOKEN}'
    };
  }

  static setDioInterceptor(String? token) {
    dio!.interceptors.add(Dioterceptors(ConstantHelper.BEARER_TOKEN));
  }
}
