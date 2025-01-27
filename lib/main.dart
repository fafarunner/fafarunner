// Dart imports:
import 'dart:async';
import 'dart:developer';

// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flame/flame.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:l10n/l10n.dart';
import 'package:logger/logger.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:sentry_logging/sentry_logging.dart';
import 'package:url_strategy/url_strategy.dart';

// Project imports:
import 'package:fafarunner/app/app.dart';
import 'package:fafarunner/config/manager.dart';
import 'package:fafarunner/config/navigator.dart';
import 'package:fafarunner/constrants/env.dart';
import 'package:fafarunner/constrants/get.dart';
import 'package:fafarunner/util/sounds.dart';

Future<void> reportErrorAndLog(FlutterErrorDetails details) async {
  printErrorLog(details.exceptionAsString(), stackTrace: details.stack);
  if (AppEnv.sentryEnabled) {
    await Sentry.captureException(details.exception, stackTrace: details.stack);
  }
}

FlutterErrorDetails makeErrorDetails(Object error, StackTrace stackTrace) {
  return FlutterErrorDetails(exception: error, stack: stackTrace);
}

Future<void> main() async {
  final widgetsBinding = SentryWidgetsFlutterBinding.ensureInitialized();

  if (isSplashSupported) {
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  }

  // app version / build number
  await initApp();

  Logger.root.level =
      kReleaseMode ? Level.OFF : Level.ALL; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
    log('${record.level.name}: ${record.time}: ${record.message}');
  });

  if (AppEnv.sentryEnabled) {
    await SentryFlutter.init(
      (options) {
        options
          ..dsn = AppEnv.sentryDsn
          ..tracesSampleRate = 1.0
          ..profilesSampleRate = 1.0
          ..attachThreads = true
          ..enableWindowMetricBreadcrumbs = true
          ..enableAppHangTracking =
              false // https://github.com/getsentry/sentry-cocoa/issues/3472
          ..addIntegration(LoggingIntegration(minEventLevel: Level.INFO))
          ..sendDefaultPii = true
          ..reportSilentFlutterErrors = true
          ..attachScreenshot = true
          ..screenshotQuality = SentryScreenshotQuality.low
          ..attachViewHierarchy = true
          ..debug = kDebugMode
          ..spotlight = Spotlight(enabled: true)
          ..enableTimeToFullDisplayTracing = true
          ..enableMetrics = true
          ..maxRequestBodySize = MaxRequestBodySize.always
          ..maxResponseBodySize = MaxResponseBodySize.always
          ..navigatorKey = AppNavigator.key;
      },
    );
  } else {
    printWarningLog('sentry is not enabled, please check the .env file');
  }

  final onError = FlutterError.onError;
  FlutterError.onError = (details) async {
    onError?.call(details);
    await reportErrorAndLog(details);
  };

  PlatformDispatcher.instance.onError = (error, stackTrace) {
    reportErrorAndLog(makeErrorDetails(error, stackTrace));
    return true;
  };

  setPathUrlStrategy();

  if (!kIsWeb) {
    await Flame.device.setLandscape();
    await Flame.device.fullScreen();
  }
  await Sounds.initialize();

  // initialize with the right locale
  await LocaleSettings.useDeviceLocale();

  Widget child = const App();
  if (AppEnv.sentryEnabled) {
    child = SentryWidget(
      child: DefaultAssetBundle(
        bundle: SentryAssetBundle(),
        child: child,
      ),
    );
  }

  runApp(
    TranslationProvider(
      child: child,
    ),
  );
}

Future<void> initApp() async {
  final packageInfo = await PackageInfo.fromPlatform();
  AppManager.instance
    ..version = packageInfo.version
    ..buildNumber = packageInfo.buildNumber;
}
