// Package imports:
import 'package:bonfire/bonfire.dart';

// Project imports:
import 'package:fafarunner/constrants/constrants.dart';

class Barrel extends GameDecoration {
  Barrel(Vector2 position)
      : super.withSprite(
          sprite: Sprite.load('items/barrel.png'),
          position: position,
          size: Vector2(tileSize, tileSize),
        );

  @override
  Future<void> onLoad() {
    add(
      RectangleHitbox(
        size: Vector2(tileSize * 0.6, tileSize * 0.6),
        position: Vector2(tileSize * 0.2, 0),
      ),
    );
    return super.onLoad();
  }
}
