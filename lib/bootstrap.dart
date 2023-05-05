import 'dart:async';
import 'dart:developer';

import 'package:fafa_runner/app/app.dart';
import 'package:flutter/widgets.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

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

void bootstrap() {
  final onError = FlutterError.onError;
  FlutterError.onError = (details) async {
    onError?.call(details);
    await reportErrorAndLog(details);
  };

  runZonedGuarded(
    () async {
      await SentryFlutter.init(
            (options) {
          options..dsn =
              'https://c0846b730913410f9041993f54e641ec@o513893.ingest.sentry.io/4505132030296064'
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
      await reportErrorAndLog(makeErrorDetails(error, stackTrace));
    },
    zoneSpecification: ZoneSpecification(
      print: (Zone self, ZoneDelegate parent, Zone zone, String line) async {
        await collectLog(line);
        // parent.print(zone, line);
      },
    ),
  );
}
