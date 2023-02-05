import 'package:flutter_boilerplate/common/constants/constants.dart';
import 'package:http_trending_api/http_trending_api.dart';

class TrendingHttpBaseClient extends AbstractBaseClient {
  TrendingHttpBaseClient(
    super.baseUrl, {
    Client? client,
  }) : _inner = client ?? Client();

  final Client _inner;

  Future<StreamedResponse> send(BaseRequest request) {
    request.headers.addAll(Constants.headers);
    return _inner.send(request);
  }

  @override
  void close() => _inner.close();
}
