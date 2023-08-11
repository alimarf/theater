import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Dioterceptors extends Interceptor {
  final String token;
  Dioterceptors(this.token);
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {

    options.headers["Authorization"] = "Bearer $token";
    super.onRequest(options, handler); //add this line
  }

  @override
  void onError(DioError dioError, ErrorInterceptorHandler handler) async {
    //handler.next(dioError);

    debugPrint('Error ${dioError.response!.statusCode}');
    if (dioError.response!.statusCode == 401) {
      // await pref.clear();
      // getRoute.Get.offAll(() => SignInPage());
    }
    super.onError(dioError, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint(response.statusCode.toString());
    // do something before response
    super.onResponse(response, handler);
  }
}
