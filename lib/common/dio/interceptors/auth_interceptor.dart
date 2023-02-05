import 'package:dio/dio.dart';
import 'package:flutter_boilerplate/app/app_manager.dart';

class AuthorizationInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] = 'Bearer ${AppManager.instance.token}';
    super.onRequest(options, handler);
  }
}
