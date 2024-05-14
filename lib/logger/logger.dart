import 'dart:async';

import 'package:logging/logging.dart';

final logger = Logger('PicGuard');

void printDebugLog(Object? object) {
  logger.shout(object);
}

void printWarningLog(Object? object) {
  logger.warning(object);
}

void printErrorLog(
  dynamic error, {
  DateTime? time,
  StackTrace? stackTrace,
}) {
  logger.severe(null, error, stackTrace);
}

FutureOr<bool> printErrorStackLog(dynamic error, StackTrace stackTrace) async {
  logger.severe(null, error, stackTrace);
  return true;
}
