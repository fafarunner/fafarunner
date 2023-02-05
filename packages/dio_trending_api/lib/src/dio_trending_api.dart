import 'dart:async';

import 'package:dio/dio.dart';
import 'package:trending_api/trending_api.dart';

/// {@template dio_trending_api}
/// A Flutter implementation of the [TrendingApi] that uses local storage.
/// {@endtemplate}
class DioTrendingApi extends TrendingApi {
  /// {@macro dio_trending_api}
  DioTrendingApi({
    required Dio dio,
  }) : _dio = dio;

  final Dio _dio;

  @override
  Future<List<Trending>?> getTrending({
    required int page,
    required int pageSize,
  }) async {
    try {
      final res = await _dio.get('/');
      if (res.statusCode == 200) {
        return List<Trending>.from((res.data as Iterable).map(
          (x) => Trending.fromJson(x as Map<String, dynamic>),
        ));
      }
      return [];
    } on Exception catch (error, stack) {
      throw TrendingRequestedException();
    }
  }
}
