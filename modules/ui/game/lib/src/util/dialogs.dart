// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:app/app.dart';
import 'package:flutter/services.dart';
import 'package:l10n/l10n.dart';

// Project imports:
import '../menu/menu.dart';
import '../../gen/assets.gen.dart';
import '../widgets/record_hotkey_dialog.dart';
import '../widgets/settings_model.dart';

class Dialogs {
  static void showGameOver(BuildContext context, VoidCallback playAgain) {
    final t = Translations.of(context);
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Image.asset(
                Assets.gameOver.keyName, // 'assets/game_over.png'
                height: 100,
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.transparent),
                ),
                onPressed: playAgain,
                child: Text(
                  t.gamePage.playAgainCap,
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'Normal',
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  static void showCongratulations(BuildContext context) {
    final t = Translations.of(context);
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Material(
          color: Colors.transparent,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  t.gamePage.congratulations,
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'Normal',
                    fontSize: 30,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                  child: Text(
                    t.gamePage.thanks,
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'Normal',
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                      const Color.fromARGB(255, 118, 82, 78),
                    ),
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  child: const Text(
                    'OK',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Normal',
                      fontSize: 17,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute<void>(
                        builder: (context) => const Menu(),
                      ),
                      (Route<dynamic> route) => false,
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static void showHotkeyDialog(
    LogicalKeyboardKey hotKey, {
    ValueChanged<LogicalKeyboardKey>? onHotKeyRecorded,
  }) {
    final context = AppNavigator.navigatorKey.currentContext!;
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => RecordHotKeyDialog(
        hotKey: hotKey,
        onHotKeyRecorded: onHotKeyRecorded,
      ),
    );
  }

  static void showSettingsModal() {
    final context = AppNavigator.navigatorKey.currentContext!;
    showModalBottomSheet<void>(
      context: context,
      isDismissible: false,
      enableDrag: false,
      isScrollControlled: true,
      builder: (BuildContext context) => const SettingsModal(),
    );
  }
}
