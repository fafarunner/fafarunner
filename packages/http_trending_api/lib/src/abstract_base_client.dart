
import 'package:http/http.dart';

/// AbstractBaseClient
abstract class AbstractBaseClient extends BaseClient {
  AbstractBaseClient(this.baseUrl);

  /// baseUrl
  final String baseUrl;

}
