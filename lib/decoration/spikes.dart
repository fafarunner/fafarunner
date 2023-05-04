import 'package:bonfire/bonfire.dart';
import 'package:fafa_runner/constrants/constrants.dart';
import 'package:fafa_runner/util/game_sprite_sheet.dart';

class Spikes extends GameDecoration with Sensor {
  Spikes(Vector2 position, {this.damage = 60})
      : super.withAnimation(
          animation: GameSpriteSheet.spikes(),
          position: position,
          size: Vector2(tileSize, tileSize),
        ) {
    setupSensorArea(
      // align: Vector2(valueByTileSize(2), valueByTileSize(4)),
      // size: Vector2(valueByTileSize(14), valueByTileSize(12)),
      intervalCheck: 100,
    );
  }

  final double damage;

  @override
  void onContact(GameComponent component) {
    if (component is Player) {
      if (animation?.currentIndex ==
              (animation?.frames.length ?? 0) - 1 ||
          animation?.currentIndex ==
              (animation?.frames.length ?? 0) - 2) {
        gameRef.player?.receiveDamage(AttackFromEnum.ENEMY, damage, 0);
      }
    }
  }

  @override
  int get priority => LayerPriority.getComponentPriority(1);

  @override
  void onContactExit(GameComponent component) {}
}
