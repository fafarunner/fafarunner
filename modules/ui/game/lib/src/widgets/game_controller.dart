import 'package:flutter/material.dart';

import 'package:bonfire/bonfire.dart';

import '../game/game.dart';
import '../util/dialogs.dart';

class GameController extends GameComponent {
  bool showGameOver = false;
  @override
  void update(double dt) {
    if (checkInterval('gameOver', 100, dt)) {
      if (gameRef.player != null && (gameRef.player?.isDead ?? false)) {
        if (!showGameOver) {
          showGameOver = true;
          _showDialogGameOver();
        }
      }
    }
    super.update(dt);
  }

  void _showDialogGameOver() {
    showGameOver = true;
    Dialogs.showGameOver(
      context,
      () {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute<void>(builder: (context) => const Game()),
          (Route<dynamic> route) => false,
        );
      },
    );
  }
}
