// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:window_manager/window_manager.dart';

// Project imports:
import 'package:fafarunner/config/navigator.dart';
import 'package:fafarunner/logger/logger.dart';

Future<void> showExitDialog() async {
  final context = AppNavigator.key.currentContext!;
  await showDialog<void>(
    context: context,
    builder: (_) {
      return AlertDialog(
        title: const Text('Confirm close'),
        content: const Text('Are you sure you want to close this window?'),
        actions: [
          TextButton(
            child: const Text('Yes'),
            onPressed: () {
              Navigator.pop(context);
              windowManager.destroy();
            },
          ),
          TextButton(
            child: const Text('No'),
            onPressed: () {
              printDebugLog('button clicked');
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}
