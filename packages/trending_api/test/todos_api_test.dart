import 'package:test/test.dart';
import 'package:trending_api/trending_api.dart';

class TestTrendingApi extends TrendingApi {
  TestTrendingApi() : super();

  @override
  dynamic noSuchMethod(Invocation invocation) {
    return super.noSuchMethod(invocation);
  }
}

void main() {
  group('TrendingApi', () {
    test('can be constructed', () {
      expect(TestTrendingApi.new, returnsNormally);
    });
  });
}
