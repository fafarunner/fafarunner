// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:bonfire/bonfire.dart';

// Project imports:
import '../constrants/constrants.dart';
import '../util/game_sprite_sheet.dart';

class Torch extends GameDecoration {
  Torch(Vector2 position, {this.empty = false})
      : super.withAnimation(
          animation: GameSpriteSheet.torch(),
          position: position,
          size: Vector2.all(tileSize),
        ) {
    setupLighting(
      LightingConfig(
        radius: width * 2.5,
        blurBorder: width,
        color: Colors.deepOrangeAccent.withValues(alpha: 0.2),
      ),
    );
  }

  bool empty = false;

  @override
  void render(Canvas canvas) {
    if (!empty) {
      super.render(canvas);
    }
  }
}
