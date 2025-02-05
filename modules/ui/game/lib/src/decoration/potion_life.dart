// Package imports:
import 'package:bonfire/bonfire.dart';

// Project imports:
import '../constrants/constrants.dart';
import '../player/knight.dart';
import '../../gen/assets.gen.dart';

class PotionLife extends GameDecoration with Sensor<Knight> {
  PotionLife(this.initPosition, this.life)
      : super.withSprite(
          sprite: Sprite.load(Assets.images.items.potionRed.keyName), // 'items/potion_red.png'
          position: initPosition,
          size: Vector2(tileSize, tileSize),
        );

  final Vector2 initPosition;
  final double life;

  bool hasContact = false;

  @override
  void onContact(Knight component) {
    if (!hasContact) {
      hasContact = true;
      _giveLife(component);
      removeFromParent();
    }
  }

  void _giveLife(Player player) {
    var lifeDistributed = 0.0;
    generateValues(
      const Duration(seconds: 1),
      onChange: (value) {
        if (lifeDistributed < life) {
          final newLife = life * value - lifeDistributed;
          lifeDistributed += newLife;
          player.addLife(newLife);
        }
      },
    );
  }
}
