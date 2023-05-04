import 'dart:async';
import 'dart:developer';

import 'package:fafa_runner/app/app.dart';
import 'package:flutter/widgets.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

void bootstrap() {
  FlutterError.onError = (details) async {
    log(details.exceptionAsString(), stackTrace: details.stack);
    await Sentry.captureException(details.exception, stackTrace: details.stack);
  };

  runZonedGuarded(
    () async {
      await SentryFlutter.init(
            (options) {
          options..dsn =
              'https://8dfc3db2260545d28251d562b94ee4ef@o4503951550316544.ingest.sentry.io/4503951553527808'
          // Set tracesSampleRate to 1.0 to capture 100% of transactions for performance monitoring.
          // We recommend adjusting this value in production.
            ..tracesSampleRate = 1.0;
        },
      );
      runApp(
        const App(),
      );
    },
    (error, stackTrace) async {
      log(error.toString(), stackTrace: stackTrace);
      await Sentry.captureException(error, stackTrace: stackTrace);
    },
  );
}
