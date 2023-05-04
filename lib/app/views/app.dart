import 'dart:io';

import 'package:fafa_runner/app/views/app/platforms.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) return const MaterialAppView();
    if (Platform.isIOS) return const IOSAppView();
    if (Platform.isMacOS) return const MacosAppView();
    if (Platform.isWindows) return const WindowsAppView();
    return const MaterialAppView();
  }
}
