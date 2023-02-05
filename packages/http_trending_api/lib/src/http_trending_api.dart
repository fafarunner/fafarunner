import 'dart:async';
import 'dart:convert';

import 'package:http_trending_api/src/abstract_base_client.dart';
import 'package:trending_api/trending_api.dart';

/// {@template http_trending_api}
/// A Flutter implementation of the [TrendingApi] that uses http.
/// {@endtemplate}
class HttpTrendingApi extends TrendingApi {
  /// {@macro http_trending_api}
  HttpTrendingApi({
    required AbstractBaseClient client,
  }) : _client = client;

  final AbstractBaseClient _client;

  @override
  Future<List<Trending>?> getTrending({
    required int page,
    required int pageSize,
  }) async {
    try {
      final res = await _client.get(Uri.parse('${_client.baseUrl}/'));
      if (res.statusCode == 200) {
        return List<Trending>.from(
            (jsonDecode(utf8.decode(res.bodyBytes)) as Iterable).map(
          (x) => Trending.fromJson(x as Map<String, dynamic>),
        ));
      }
      return [];
    } catch (error, stack) {
      throw TrendingRequestedException();
    } finally {
      _client.close();
    }
  }
}
