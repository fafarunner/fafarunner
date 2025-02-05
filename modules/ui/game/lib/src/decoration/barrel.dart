// Package imports:
import 'package:bonfire/bonfire.dart' hide Assets;

// Project imports:
import '../constrants/constrants.dart';
import '../../gen/assets.gen.dart';

class Barrel extends GameDecoration {
  Barrel(Vector2 position)
      : super.withSprite(
          sprite: Sprite.load(Assets.images.items.barrel.keyName), // 'items/barrel.png'
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
