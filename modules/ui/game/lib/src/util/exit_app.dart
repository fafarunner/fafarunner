import 'dart:ui';

import 'package:flutter/services.dart';

void exitApp([int exitCode = 0]) {
  ServicesBinding.instance.exitApplication(AppExitType.required, exitCode);
}
