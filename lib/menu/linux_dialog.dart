import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

Future<void> showLinuxDialog(BuildContext context) async {
  await showDialog(
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
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}
