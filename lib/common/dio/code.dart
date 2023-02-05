
import 'package:flutter_boilerplate/common/dio/event/http_error_event.dart';
import 'package:flutter_boilerplate/common/dio/widget/http_error_boundary.dart';

class Code {
  ///网络错误
  static const networkError = -1;

  ///网络超时
  static const networkTimeout = -2;

  ///网络返回数据格式化一次
  static const networkJsonException = -3;

  static const success = 200;

  static const unauthorizedUrls = [];

  static String? errorHandleFunction(int code, String message, bool noTip) {
    if (noTip) {
      return message;
    }

    HttpErrorBoundary.handleErrorEvent(HttpErrorEvent(code, message));

    return message;
  }
}
