import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:bonfire/bonfire.dart';

import '../player/knight.dart';
import '../../gen/assets.gen.dart';

class BarLifeComponent extends InterfaceComponent {
  BarLifeComponent()
      : super(
          id: 1,
          position: Vector2(20, 20),
          spriteUnselected: Sprite.load(Assets.images.healthUi.keyName), // 'health_ui.png'
          size: Vector2(120, 40),
        );

  double padding = 20;
  double widthBar = 90;
  double strokeWidth = 12;

  double maxLife = 0;
  double life = 0;
  double maxStamina = 100;
  double stamina = 0;

  @override
  void update(double dt) {
    if (gameRef.player != null) {
      life = gameRef.player!.life;
      maxLife = gameRef.player!.maxLife;
      if (gameRef.player is Knight) {
        stamina = (gameRef.player! as Knight).stamina;
      }
    }
    super.update(dt);
  }

  @override
  void render(Canvas canvas) {
    try {
      _drawLife(canvas);
      _drawStamina(canvas);
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    super.render(canvas);
  }

  void _drawLife(Canvas canvas) {
    const xBar = 29.0;
    const yBar = 10.0;
    canvas.drawLine(
      const Offset(xBar, yBar),
      Offset(xBar + widthBar, yBar),
      Paint()
        ..color = Colors.blueGrey[800]!
        ..strokeWidth = strokeWidth
        ..style = PaintingStyle.fill,
    );

    final currentBarLife = (life * widthBar) / maxLife;

    canvas.drawLine(
      const Offset(xBar, yBar),
      Offset(xBar + currentBarLife, yBar),
      Paint()
        ..color = _getColorLife(currentBarLife)
        ..strokeWidth = strokeWidth
        ..style = PaintingStyle.fill,
    );
  }

  void _drawStamina(Canvas canvas) {
    const xBar = 48.0;
    const yBar = 47.0;

    final currentBarStamina = (stamina * widthBar) / maxStamina;

    canvas.drawLine(
      const Offset(xBar, yBar),
      Offset(xBar + currentBarStamina, yBar),
      Paint()
        ..color = Colors.yellow
        ..strokeWidth = strokeWidth
        ..style = PaintingStyle.fill,
    );
  }

  Color _getColorLife(double currentBarLife) {
    if (currentBarLife > widthBar - (widthBar / 3)) {
      return Colors.green;
    }
    if (currentBarLife > (widthBar / 3)) {
      return Colors.yellow;
    } else {
      return Colors.red;
    }
  }
}
