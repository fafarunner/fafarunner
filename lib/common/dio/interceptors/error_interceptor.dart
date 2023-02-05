
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio_trending_api/dio_trending_api.dart';
import 'package:flutter_boilerplate/common/dio/code.dart';
import 'package:flutter_boilerplate/common/models/response.dart' hide Response;

class ErrorInterceptor extends InterceptorsWrapper {

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    // 没有网络
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      return handler.reject(
        DioError(
          requestOptions: options,
          type: DioErrorType.other,
          response: Response(
            requestOptions: options,
            data: ResponseResult(
              Code.errorHandleFunction(
                  Code.networkError, 'Network Error', false),
              Code.networkError,
            ),
          ),
        ),
      );
    }
    super.onRequest(options, handler);
  }

}
