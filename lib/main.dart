import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:app/app.dart';
import 'package:bonfire/bonfire.dart';
import 'package:flame/flame.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:game/game.dart';
import 'package:l10n/l10n.dart';
import 'package:logger/logger.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:sentry_logging/sentry_logging.dart';
import 'package:shared/shared.dart';
import 'package:url_strategy/url_strategy.dart';

import 'package:fafarunner/app/app.dart';
import 'package:fafarunner/constrants/env.dart';

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

  // init storage
  await initialize();

  Logger.root.level = kReleaseMode
      ? Level.OFF
      : Level.ALL; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
    debugPrint('${record.level.name}: ${record.time}: ${record.message}');
  });

  if (AppEnv.sentryEnabled) {
    await SentryFlutter.init((options) {
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
        ..maxRequestBodySize = MaxRequestBodySize.always
        ..navigatorKey = AppNavigator.navigatorKey;
    });
  } else {
    printWarningLog('sentry is not enabled, please check the .env file');
  }

  FlutterError.onError = (details) async {
    FlutterError.presentError(details);
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
  Flame.images.prefix = '';
  await Sounds.initialize();

  // initialize with the right locale
  await LocaleSettings.useDeviceLocale();

  Widget child = MultiProvider(
    providers: [
      ChangeNotifierProvider<SettingsProvider>(
        create: (_) => SettingsProvider(),
      ),
    ],
    child: const App(),
  );

  if (AppEnv.sentryEnabled) {
    child = SentryWidget(
      child: DefaultAssetBundle(bundle: SentryAssetBundle(), child: child),
    );
  }

  runApp(TranslationProvider(child: child));
}
