import 'package:flutter_boilerplate/common/constants/constants.dart';
import 'package:flutter_boilerplate/common/dio/base_http.dart';

final OtherHttp trendingHttp = OtherHttp(Constants.githubTrendingApiPrefix);
final OtherHttp contributionsHttp = OtherHttp(Constants.githubOtherApiPrefix);
final OtherHttp loginHttp = OtherHttp('https://github.com');

class OtherHttp extends BaseHttp {
  OtherHttp(String baseUrl) : super(baseUrl: baseUrl);

  @override
  void init() {
    // do something
  }
}
