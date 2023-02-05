import 'package:trending_api/trending_api.dart';
import 'package:trending_repository_middleware/trending_repository_middleware.dart';

/// {@template trending_repository}
/// A repository that handles trending related requests.
/// {@endtemplate}
class TrendingRepository {
  /// {@macro trending_repository}
  const TrendingRepository({
    required TrendingApi trendingApi,
    TrendingRepositoryMiddleware? trendingRepositoryMiddleware,
  })  : _trendingApi = trendingApi,
        _trendingRepositoryMiddleware = trendingRepositoryMiddleware;

  final TrendingApi _trendingApi;
  final TrendingRepositoryMiddleware? _trendingRepositoryMiddleware;

  /// Provides a [Future] of all trending.
  Future<List<Trending>?> getTrending({
    bool pullDown = false,
    bool loadMore = false,
    int page = 1,
    int pageSize = 25,
  }) async {
    List<Trending>? trendingList = [];
    final suffix = loadMore ? '${page}_$pageSize' : null;
    if (_trendingRepositoryMiddleware != null && !pullDown) {
      trendingList =
          await _trendingRepositoryMiddleware!.getTrending(suffix: suffix);
    }
    if (trendingList == null || trendingList.isEmpty) {
      trendingList = await _trendingApi.getTrending(
        page: page,
        pageSize: pageSize,
      );
    }
    if (_trendingRepositoryMiddleware != null &&
        trendingList != null &&
        trendingList.isNotEmpty) {
      await _trendingRepositoryMiddleware!
          .saveTrending(trendingList, suffix: suffix);
    }
    return trendingList;
  }
}
