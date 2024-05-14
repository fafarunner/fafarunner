import 'package:bonfire/bonfire.dart';
import 'package:fafarunner/constrants/constrants.dart';
import 'package:fafarunner/player/knight.dart';
import 'package:fafarunner/util/game_sprite_sheet.dart';

class Spikes extends GameDecoration with Sensor<Knight> {
  Spikes(Vector2 position, {this.damage = 60})
      : super.withAnimation(
          animation: GameSpriteSheet.spikes(),
          position: position,
          size: Vector2(tileSize, tileSize),
        );

  final double damage;
  Knight? player;

  @override
  void onContact(Knight component) {
    player = component;
  }

  @override
  void update(double dt) {
    if (isAnimationLastFrame) {
      player?.receiveDamage(AttackFromEnum.ENEMY, damage, 0);
    }
    super.update(dt);
  }

  @override
  int get priority => LayerPriority.getComponentPriority(1);

  @override
  void onContactExit(Knight component) {
    player = null;
  }
}
