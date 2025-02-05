// Package imports:
import 'package:bonfire/bonfire.dart';

import '../../gen/assets.gen.dart';

class GameSpriteSheet {
  static Future<SpriteAnimation> openTheDoor() => SpriteAnimation.load(
        Assets.images.items.doorOpen.keyName, // 'items/door_open.png'
        SpriteAnimationData.sequenced(
          amount: 14,
          stepTime: 0.1,
          textureSize: Vector2(32, 32),
        ),
      );
  static Future<SpriteAnimation> spikes() => SpriteAnimation.load(
        Assets.images.items.spikes.keyName, // 'items/spikes.png'
        SpriteAnimationData.sequenced(
          amount: 10,
          stepTime: 0.1,
          textureSize: Vector2(16, 16),
        ),
      );
  static Future<SpriteAnimation> torch() => SpriteAnimation.load(
        Assets.images.items.torchSpritesheet.keyName, // 'items/torch_spritesheet.png'
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.1,
          textureSize: Vector2(16, 16),
        ),
      );

  static Future<SpriteAnimation> explosion() => SpriteAnimation.load(
        Assets.images.explosion.keyName, // 'explosion.png'
        SpriteAnimationData.sequenced(
          amount: 7,
          stepTime: 0.1,
          textureSize: Vector2(32, 32),
        ),
      );

  static Future<SpriteAnimation> smokeExplosion() => SpriteAnimation.load(
        Assets.images.smokeExplosin.keyName, // 'smoke_explosin.png'
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.1,
          textureSize: Vector2(16, 16),
        ),
      );

  static Future<SpriteAnimation> fireBallAttackRight() => SpriteAnimation.load(
        Assets.images.player.fireballRight.keyName, // 'player/fireball_right.png'
        SpriteAnimationData.sequenced(
          amount: 3,
          stepTime: 0.1,
          textureSize: Vector2(23, 23),
        ),
      );

  static Future<SpriteAnimation> fireBallAttackLeft() => SpriteAnimation.load(
        Assets.images.player.fireballLeft.keyName, // 'player/fireball_left.png'
        SpriteAnimationData.sequenced(
          amount: 3,
          stepTime: 0.1,
          textureSize: Vector2(23, 23),
        ),
      );

  static Future<SpriteAnimation> fireBallAttackTop() => SpriteAnimation.load(
        Assets.images.player.fireballTop.keyName, // 'player/fireball_top.png'
        SpriteAnimationData.sequenced(
          amount: 3,
          stepTime: 0.1,
          textureSize: Vector2(23, 23),
        ),
      );

  static Future<SpriteAnimation> fireBallAttackBottom() => SpriteAnimation.load(
        Assets.images.player.fireballBottom.keyName, // 'player/fireball_bottom.png'
        SpriteAnimationData.sequenced(
          amount: 3,
          stepTime: 0.1,
          textureSize: Vector2(23, 23),
        ),
      );

  static Future<SpriteAnimation> fireBallExplosion() => SpriteAnimation.load(
        Assets.images.player.explosionFire.keyName, // 'player/explosion_fire.png'
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.1,
          textureSize: Vector2(32, 32),
        ),
      );
}
