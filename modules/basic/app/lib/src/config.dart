/// [AppConfig]
class AppConfig {
  AppConfig._internal();

  /// [shared]
  static final AppConfig shared = AppConfig._internal();

  /// [container]
  String get container => 'FaFaRunner';

  /// initial method
  void init() {}
}
