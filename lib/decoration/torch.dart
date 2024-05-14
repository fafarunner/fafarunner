import 'package:bonfire/bonfire.dart';
import 'package:fafarunner/constrants/constrants.dart';
import 'package:fafarunner/util/game_sprite_sheet.dart';
import 'package:flutter/material.dart';

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
        color: Colors.deepOrangeAccent.withOpacity(0.2),
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
