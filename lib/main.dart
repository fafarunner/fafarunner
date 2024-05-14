import 'dart:async';
import 'dart:developer';

import 'package:fafarunner/app/app.dart';
import 'package:fafarunner/constrants/get.dart';
import 'package:fafarunner/url_strategy/url_strategy_non_web.dart'
    if (dart.library.html) 'package:fafarunner/url_strategy/url_strategy_web.dart';
import 'package:fafarunner/util/sounds.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flame/flame.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:window_manager/window_manager.dart';

Future<void> collectLog(String line) async {
  log(line);
  await Sentry.captureMessage(line);
}

Future<void> reportErrorAndLog(FlutterErrorDetails details) async {
  log(details.exceptionAsString(), stackTrace: details.stack);
  await Sentry.captureException(details.exception, stackTrace: details.stack);
}

FlutterErrorDetails makeErrorDetails(Object error, StackTrace stackTrace) {
  return FlutterErrorDetails(exception: error, stack: stackTrace);
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

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

  if (isMobile) {
    await Firebase.initializeApp();
  }

  if (isDesktop) {
    await WindowManager.instance.ensureInitialized();
    await windowManager.waitUntilReadyToShow().then((_) async {
      await windowManager.center();
      await windowManager.show();
      await windowManager.setPreventClose(true);
      await windowManager.setSkipTaskbar(false);
    });
  }
  await SentryFlutter.init(
    (options) {
      options
        ..dsn =
            'https://c0846b730913410f9041993f54e641ec@o513893.ingest.sentry.io/4505132030296064'
        ..tracesSampleRate = 1.0;
    },
  );

  runApp(const App());
}
