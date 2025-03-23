import 'package:collection/collection.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:game/src/util/navigator_util.dart';
import 'package:hotkey_manager/hotkey_manager.dart';

import 'package:l10n/l10n.dart';
import 'package:logger/logger.dart';
import 'package:theme/theme.dart';

class RecordHotKeyDialog extends StatefulWidget {
  const RecordHotKeyDialog({
    required this.hotKey,
    this.onHotKeyRecorded,
    super.key,
  });

  final HotKey hotKey;
  final ValueChanged<HotKey>? onHotKeyRecorded;

  @override
  State<RecordHotKeyDialog> createState() => _RecordHotKeyDialogState();
}

class _RecordHotKeyDialogState extends State<RecordHotKeyDialog> {
  late HotKey _hotKey;
  bool allowed = true;

  @override
  void initState() {
    super.initState();
    _hotKey = widget.hotKey;
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
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
                    initalHotKey: widget.hotKey,
                    onHotKeyRecorded: (hotKey) {
                      printDebugLog('hotKey: ${hotKey.toJson()}');
                      if (hotKey.modifiers != null && hotKey.modifiers!.isNotEmpty) {
                        BotToast.showText(text: t.settings.shortcutsDescription);
                        setState(() => allowed = false);
                        return;
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
            hotKeyManager.unregister(widget.hotKey);
            final registeredHotKey =
                hotKeyManager.registeredHotKeyList.firstWhereOrNull((item) {
              if (item.key != _hotKey.key) return false;
              final itemModifiers =
                  Set<HotKeyModifier>.from(item.modifiers ?? []);
              final customModifiers =
                  Set<HotKeyModifier>.from(_hotKey.modifiers ?? []);
              return setEquals(itemModifiers, customModifiers);
            });
            printDebugLog('registeredHotKey: ${registeredHotKey?.toJson()}');
            if (registeredHotKey != null) {
              BotToast.showText(text: 'Hot key registered');
              return;
            }
            hotKeyManager.register(
              _hotKey,
              keyDownHandler: (hotkey) {
                printDebugLog('[keyDownHandler]: ${hotkey.toJson()}');
              },
              keyUpHandler: (hotkey) {
                printDebugLog('[keyUpHandler]: ${hotkey.toJson()}');
              },
            );
            widget.onHotKeyRecorded?.call(_hotKey);
            NavigatorUtil.pop();
          },
          child: Text(t.buttons.ok),
        ),
      ],
    );
  }
}
