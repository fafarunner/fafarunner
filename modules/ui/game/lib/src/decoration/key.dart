import 'package:bonfire/bonfire.dart';

import '../constrants/constrants.dart';
import '../player/knight.dart';
import '../../gen/assets.gen.dart';

class DoorKey extends GameDecoration with Sensor {
  DoorKey(Vector2 position)
      : super.withSprite(
          sprite: Sprite.load(Assets.images.items.keySilver.keyName), // 'items/key_silver.png'
          position: position,
          size: Vector2(tileSize, tileSize),
        );

  @override
  void onContact(GameComponent component) {
    if (component is Knight) {
      component.containKey = true;
      removeFromParent();
    }
  }
}
