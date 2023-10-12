import 'package:bonfire/bonfire.dart';
import 'package:fafa_runner/constrants/constrants.dart';
import 'package:fafa_runner/player/knight.dart';

class PotionLife extends GameDecoration with Sensor<Knight> {
  final Vector2 initPosition;
  final double life;

  bool hasContact = false;

  PotionLife(this.initPosition, this.life)
      : super.withSprite(
          sprite: Sprite.load('items/potion_red.png'),
          position: initPosition,
          size: Vector2(tileSize, tileSize),
        );

  @override
  void onContact(Knight player) {
    if (!hasContact) {
      hasContact = true;
      _giveLife(player);
      removeFromParent();
    }
  }

  void _giveLife(Player player) {
    double _lifeDistributed = 0;
    generateValues(
      const Duration(seconds: 1),
      onChange: (value) {
        if (_lifeDistributed < life) {
          double newLife = life * value - _lifeDistributed;
          _lifeDistributed += newLife;
          player.addLife(newLife);
        }
      },
    );
  }
}
