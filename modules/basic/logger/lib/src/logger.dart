import 'dart:async';
import 'package:logging/logging.dart';

/// logger
final logger = Logger('FaFaRunner');

/// debug
void printDebugLog(Object? object) {
  logger.shout(object);
}

/// warning
void printWarningLog(Object? object) {
  logger.warning(object);
}

/// error
void printErrorLog(
    dynamic error, {
      DateTime? time,
      StackTrace? stackTrace,
    }) {
  logger.severe(null, error, stackTrace);
}

/// print error stack info
FutureOr<bool> printErrorStackLog(dynamic error, StackTrace stackTrace) async {
  logger.severe(null, error, stackTrace);
  return true;
}
