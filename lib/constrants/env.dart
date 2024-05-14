class AppEnv {
  static String sentryDsn = const String.fromEnvironment('SENTRY_DSN');

  static bool sentryEnabled = sentryDsn.isNotEmpty;
}
