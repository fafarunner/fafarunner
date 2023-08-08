import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:window_manager/window_manager.dart';

Future<void> showMacosDialog(BuildContext context) async {
  await showCupertinoDialog(
    context: context,
    builder: (_) {
      return MacosAlertDialog(
        message: const Text('Are you sure you want to close this window?'),
        primaryButton: PushButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          controlSize: ControlSize.large,
          child: const Text('No'),
        ),
        secondaryButton: PushButton(
          onPressed: () async {
            Navigator.of(context).pop();
            await windowManager.destroy();
          },
          controlSize: ControlSize.large,
          secondary: true,
          child: const Text('Yes'),
        ),
        title: const Text('Confirm close'),
        appIcon: const MacosIcon(CupertinoIcons.info),
      );
    },
  );
}
