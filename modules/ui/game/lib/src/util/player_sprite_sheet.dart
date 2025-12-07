import 'package:bonfire/bonfire.dart';

import '../../gen/assets.gen.dart';

class PlayerSpriteSheet {
  static Future<SpriteAnimation> idleRight() => SpriteAnimation.load(
        Assets.images.player.knightIdle.keyName, // 'player/knight_idle.png'
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.1,
          textureSize: Vector2(16, 16),
        ),
      );

  static Future<SpriteAnimation> attackEffectBottom() => SpriteAnimation.load(
        Assets.images.player.playerAtackEffectBottom.keyName, // 'player/player_atack_effect_bottom.png'
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.1,
          textureSize: Vector2(16, 16),
        ),
      );

  static Future<SpriteAnimation> attackEffectLeft() => SpriteAnimation.load(
        Assets.images.player.playerAtackEffectLeft.keyName, // 'player/player_atack_effect_left.png'
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.1,
          textureSize: Vector2(16, 16),
        ),
      );
  static Future<SpriteAnimation> attackEffectRight() => SpriteAnimation.load(
        Assets.images.player.playerAtackEffectRight.keyName, // 'player/player_atack_effect_right.png'
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.1,
          textureSize: Vector2(16, 16),
        ),
      );
  static Future<SpriteAnimation> attackEffectTop() => SpriteAnimation.load(
        Assets.images.player.playerAtackEffectTop.keyName, // 'player/player_atack_effect_top.png'
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.1,
          textureSize: Vector2(16, 16),
        ),
      );

  static SimpleDirectionAnimation playerAnimations() =>
      SimpleDirectionAnimation(
        idleLeft: SpriteAnimation.load(
          Assets.images.player.knightIdleLeft.keyName, // 'player/knight_idle_left.png'
          SpriteAnimationData.sequenced(
            amount: 6,
            stepTime: 0.1,
            textureSize: Vector2(16, 16),
          ),
        ),
        idleRight: idleRight(),
        runLeft: SpriteAnimation.load(
          Assets.images.player.knightRunLeft.keyName, // 'player/knight_run_left.png'
          SpriteAnimationData.sequenced(
            amount: 6,
            stepTime: 0.1,
            textureSize: Vector2(16, 16),
          ),
        ),
        runRight: SpriteAnimation.load(
          Assets.images.player.knightRun.keyName, // 'player/knight_run.png'
          SpriteAnimationData.sequenced(
            amount: 6,
            stepTime: 0.1,
            textureSize: Vector2(16, 16),
          ),
        ),
      );
}
