import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:trending_repository/trending_repository.dart';

import 'helpers/helpers.dart';

void main() {
  late TrendingRepository trendingRepository;

  setUp(() {
    trendingRepository = MockTrendingRepository();
    when(
      () => trendingRepository.getTrending(),
    ).thenAnswer((_) => Future.value([]));
  });

}
