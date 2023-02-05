// ignore_for_file: prefer_const_constructors
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:trending_api/trending_api.dart';
import 'package:trending_repository/trending_repository.dart';

class MockTrendingApi extends Mock implements TrendingApi {}

class FakeTrending extends Fake implements Trending {}

void main() {
  group('TodosRepository', () {
    late TrendingApi api;

    final trendings = [
      Trending(
        author: 'author',
        name: 'name',
        avatar: 'avatar',
        url: 'url',
        description: 'description',
        stars: 0,
        forks: 0,
        currentPeriodStars: 0,
        builtBy: [
          BuiltBy(username: 'username', href: 'href', avatar: 'avatar'),
          BuiltBy(username: 'username1', href: 'href1', avatar: 'avatar1'),
        ],
      ),
      Trending(
        author: 'author1',
        name: 'name1',
        avatar: 'avatar1',
        url: 'url1',
        description: 'description1',
        stars: 10,
        forks: 10,
        currentPeriodStars: 10,
        builtBy: [
          BuiltBy(username: 'username', href: 'href', avatar: 'avatar'),
          BuiltBy(username: 'username1', href: 'href1', avatar: 'avatar1'),
        ],
      ),
    ];

    setUpAll(() {
      registerFallbackValue(FakeTrending());
    });

    setUp(() {
      api = MockTrendingApi();
      when(() => api.getTrending(page: 1, pageSize: 20)).thenAnswer((_) => Future.value(trendings));
    });

    TrendingRepository createSubject() => TrendingRepository(trendingApi: api);

    group('constructor', () {
      test('works properly', () {
        expect(
          createSubject,
          returnsNormally,
        );
      });
    });

    group('getTrending', () {
      test('makes correct api request', () {
        final subject = createSubject();

        expect(
          subject.getTrending(),
          isNot(throwsA(anything)),
        );

        verify(() => api.getTrending(page: 1, pageSize: 20)).called(1);
      });

      test('returns stream of current list todos', () {
        expect(
          createSubject().getTrending(),
          emits(trendings),
        );
      });
    });
  });
}
