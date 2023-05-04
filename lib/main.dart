import 'dart:io';

import 'package:fafa_runner/bootstrap.dart';
import 'package:fafa_runner/constrants/get.dart';
import 'package:fafa_runner/util/sounds.dart';
import 'package:flame/flame.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (!kIsWeb) {
    await Flame.device.setLandscape();
    await Flame.device.fullScreen();
  }
  await Sounds.initialize();

  if (isDesktop) {
    await WindowManager.instance.ensureInitialized();
    await windowManager.waitUntilReadyToShow().then((_) async {
      if (Platform.isWindows) {
        await windowManager.setTitleBarStyle(
          TitleBarStyle.hidden,
          windowButtonVisibility: false,
        );
      }

      // await windowManager.setSize(const Size(755, 545));
      // await windowManager.setMinimumSize(const Size(755, 545));
      await windowManager.center();
      await windowManager.show();
      await windowManager.setPreventClose(true);
      await windowManager.setSkipTaskbar(false);
    });
  }

  bootstrap();
}
