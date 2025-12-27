import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:l10n/l10n.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:theme/theme.dart';

import '../constants/constants.dart';
import '../providers/providers.dart';
import '../util/navigator_util.dart';
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
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final state = context.watch<SettingsProvider>();
    final directionalKeys = state.directionalKeys;
    final attackKey = state.attackKey;
    final fireKey = state.fireKey;
    return AlertDialog(
      title: Text(t.hotkeyDialog.description, textAlign: TextAlign.center),
      titleTextStyle: TextStyle(
        fontSize: 14,
        color: isDark ? FRColors.white : FRColors.black,
      ),
      titlePadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Container(
              width: 300,
              height: 60,
              decoration: BoxDecoration(
                border: Border.all(color: FRColors.primaryColor),
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
                        if (keyboardDirectionalKeys[directionalKeys].contain(
                          hotKey,
                        )) {
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
        TextButton(onPressed: NavigatorUtil.pop, child: Text(t.buttons.cancel)),
        TextButton(
          onPressed: !allowed
              ? null
              : () {
                  widget.onHotKeyRecorded?.call(_hotKey);
                  NavigatorUtil.pop();
                },
          child: Text(t.buttons.ok),
        ),
      ],
    );
  }
}
