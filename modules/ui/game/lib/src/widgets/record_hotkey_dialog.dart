import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:game/src/constrants/constrants.dart';
import 'package:game/src/util/navigator_util.dart';
import 'package:get/get.dart' hide Translations;

import 'package:l10n/l10n.dart';
import 'package:logger/logger.dart';
import 'package:theme/theme.dart';

import '../controllers/settings_controller.dart';
import 'hotkey_recorder.dart';

class RecordHotKeyDialog extends StatefulWidget {
  const RecordHotKeyDialog({
    required this.hotKey,
    this.onHotKeyRecorded,
    super.key,
  });

  final LogicalKeyboardKey hotKey;
  final ValueChanged<LogicalKeyboardKey>? onHotKeyRecorded;

  @override
  State<RecordHotKeyDialog> createState() => _RecordHotKeyDialogState();
}

class _RecordHotKeyDialogState extends State<RecordHotKeyDialog> {
  late LogicalKeyboardKey _hotKey;
  bool allowed = true;

  @override
  void initState() {
    super.initState();
    _hotKey = widget.hotKey;
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final controller = Get.find<SettingsController>();
    final directionalKeys = controller.directionalKeys.value;
    final attackKey = controller.attackKey.value;
    final fireKey = controller.fireKey.value;
    return AlertDialog(
      title: Text(
        t.hotkeyDialog.description,
        textAlign: TextAlign.center,
      ),
      titleTextStyle: const TextStyle(fontSize: 14),
      titlePadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Container(
              width: 300,
              height: 60,
              decoration: BoxDecoration(
                border: Border.all(
                  color: FRColors.primaryColor,
                ),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  HotKeyRecorder(
                    initialHotKey: widget.hotKey,
                    onHotKeyRecorded: (hotKey) {
                      printDebugLog('hotKey: ${hotKey.keyLabel}');

                      if (hotKey != widget.hotKey) {
                        // if (hotKey == LogicalKeyboardKey.space) {
                        //   BotToast.showText(text: t.settings.shortcutsRegistered);
                        //   setState(() => allowed = false);
                        //   return;
                        // }
                        if (keyboardDirectionalKeys[directionalKeys].contain(hotKey)) {
                          BotToast.showText(text: t.settings.shortcutsArrow);
                          setState(() => allowed = false);
                          return;
                        }

                        if ([attackKey, fireKey].contains(hotKey)) {
                          BotToast.showText(text: t.settings.shortcutsUsed);
                          setState(() => allowed = false);
                          return;
                        }
                      }

                      setState(() {
                        allowed = true;
                        _hotKey = hotKey;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      contentPadding: const EdgeInsets.fromLTRB(24, 0, 24, 12),
      actions: <Widget>[
        TextButton(
          onPressed: NavigatorUtil.pop,
          child: Text(t.buttons.cancel),
        ),
        TextButton(
          onPressed: !allowed ? null : () {
            widget.onHotKeyRecorded?.call(_hotKey);
            NavigatorUtil.pop();
          },
          child: Text(t.buttons.ok),
        ),
      ],
    );
  }
}
