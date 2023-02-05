import 'dart:convert';

import 'package:dio/native_imp.dart';
import 'package:dio_trending_api/dio_trending_api.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_boilerplate/common/constants/constants.dart';
import 'package:flutter_boilerplate/common/dio/interceptors/base_interceptor.dart';
import 'package:flutter_boilerplate/common/dio/interceptors/error_interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

// 必须是顶层函数
dynamic _parseAndDecode(String response) {
  return jsonDecode(response);
}

Future parseJson(String text) {
  return compute(_parseAndDecode, text);
}

abstract class BaseHttp extends DioForNative {
  BaseHttp({String baseUrl = Constants.githubApiPrefix}) {
    /// 初始化 加入app通用处理
    (transformer as DefaultTransformer).jsonDecodeCallback = parseJson;
    interceptors.addAll([
      ErrorInterceptor(),
      BaseInterceptor(baseUrl),
      if (!kReleaseMode) ...[
            PrettyDioLogger(
              requestHeader: true,
              requestBody: true,
            )
          ],
    ]);
    init();
  }

  void init();
}
