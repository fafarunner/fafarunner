import 'package:trending_common/trending_common.dart';

/// {@template trending_repository_middleware}
/// A repository that handles trending related requests.
/// {@endtemplate}
abstract class TrendingRepositoryMiddleware {
  /// {@macro trending_repository_middleware}
  const TrendingRepositoryMiddleware();

  /// Provides a [Future] of all trending.
  Future<List<Trending>?> getTrending({String? suffix});

  ///
  Future<void> saveTrending(List<Trending> trendingList, {String? suffix});
}
