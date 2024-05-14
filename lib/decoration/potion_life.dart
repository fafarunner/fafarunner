import 'package:bonfire/bonfire.dart';
import 'package:fafarunner/constrants/constrants.dart';
import 'package:fafarunner/player/knight.dart';

class PotionLife extends GameDecoration with Sensor<Knight> {
  PotionLife(this.initPosition, this.life)
      : super.withSprite(
          sprite: Sprite.load('items/potion_red.png'),
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
