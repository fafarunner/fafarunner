import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_boilerplate/app/app_manager.dart';
import 'package:flutter_boilerplate/common/dio/base_http.dart';

final LoginHttp loginHttp = LoginHttp();

class LoginHttp extends BaseHttp {

  @override
  void init() {
    interceptors.addAll([AuthorizationApiInterceptor()]);
  }
}

/// App相关 API
class AuthorizationApiInterceptor extends InterceptorsWrapper {

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final username = AppManager.instance.username;
    final password = AppManager.instance.password;
    options.headers['Authorization'] = 'Basic ${base64.encode(utf8.encode('$username:$password')).trim()}';
    options.headers['content-type'] = Headers.jsonContentType;
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
      handler.resolve(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    handler.reject(err);
  }
}

final LogoutHttp logoutHttp = LogoutHttp();

class LogoutHttp extends BaseHttp {

  @override
  void init() {
    interceptors.addAll([AuthorizationDeleteApiInterceptor()]);
  }
}

class AuthorizationDeleteApiInterceptor extends InterceptorsWrapper {

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final username = AppManager.instance.username;
    final password = AppManager.instance.password;
    options.headers['Authorization'] = 'Basic ${base64.encode(utf8.encode('$username:$password')).trim()}';
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.resolve(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    handler.reject(err);
  }
}
