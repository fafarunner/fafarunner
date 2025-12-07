import 'package:bonfire/bonfire.dart';

import '../../gen/assets.gen.dart';

class EnemySpriteSheet {
  static Future<SpriteAnimation> enemyAttackEffectBottom() =>
      SpriteAnimation.load(
        Assets.images.enemy.atackEffectBottom.keyName, // 'enemy/atack_effect_bottom.png'
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.1,
          textureSize: Vector2(16, 16),
        ),
      );

  static Future<SpriteAnimation> enemyAttackEffectLeft() =>
      SpriteAnimation.load(
        Assets.images.enemy.atackEffectLeft.keyName, // 'enemy/atack_effect_left.png'
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.1,
          textureSize: Vector2(16, 16),
        ),
      );
  static Future<SpriteAnimation> enemyAttackEffectRight() =>
      SpriteAnimation.load(
        Assets.images.enemy.atackEffectRight.keyName, // 'enemy/atack_effect_right.png'
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.1,
          textureSize: Vector2(16, 16),
        ),
      );
  static Future<SpriteAnimation> enemyAttackEffectTop() => SpriteAnimation.load(
        Assets.images.enemy.atackEffectTop.keyName, // 'enemy/atack_effect_top.png'
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.1,
          textureSize: Vector2(16, 16),
        ),
      );

  static Future<SpriteAnimation> bossIdleRight() => SpriteAnimation.load(
        Assets.images.enemy.boss.bossIdle.keyName, // 'enemy/boss/boss_idle.png'
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.1,
          textureSize: Vector2(32, 36),
        ),
      );

  static SimpleDirectionAnimation bossAnimations() => SimpleDirectionAnimation(
        idleLeft: SpriteAnimation.load(
          Assets.images.enemy.boss.bossIdleLeft.keyName, // 'enemy/boss/boss_idle_left.png'
          SpriteAnimationData.sequenced(
            amount: 4,
            stepTime: 0.1,
            textureSize: Vector2(32, 36),
          ),
        ),
        idleRight: bossIdleRight(),
        runLeft: SpriteAnimation.load(
          Assets.images.enemy.boss.bossRunLeft.keyName, // 'enemy/boss/boss_run_left.png'
          SpriteAnimationData.sequenced(
            amount: 4,
            stepTime: 0.1,
            textureSize: Vector2(32, 36),
          ),
        ),
        runRight: SpriteAnimation.load(
          Assets.images.enemy.boss.bossRunRight.keyName, // 'enemy/boss/boss_run_right.png'
          SpriteAnimationData.sequenced(
            amount: 4,
            stepTime: 0.1,
            textureSize: Vector2(32, 36),
          ),
        ),
      );

  static Future<SpriteAnimation> goblinIdleRight() => SpriteAnimation.load(
        Assets.images.enemy.goblin.goblinIdle.keyName, // 'enemy/goblin/goblin_idle.png'
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.1,
          textureSize: Vector2(16, 16),
        ),
      );

  static SimpleDirectionAnimation goblinAnimations() =>
      SimpleDirectionAnimation(
        idleLeft: SpriteAnimation.load(
          Assets.images.enemy.goblin.goblinIdleLeft.keyName, // 'enemy/goblin/goblin_idle_left.png'
          SpriteAnimationData.sequenced(
            amount: 6,
            stepTime: 0.1,
            textureSize: Vector2(16, 16),
          ),
        ),
        idleRight: goblinIdleRight(),
        runLeft: SpriteAnimation.load(
          Assets.images.enemy.goblin.goblinRunLeft.keyName, // 'enemy/goblin/goblin_run_left.png'
          SpriteAnimationData.sequenced(
            amount: 6,
            stepTime: 0.1,
            textureSize: Vector2(16, 16),
          ),
        ),
        runRight: SpriteAnimation.load(
          Assets.images.enemy.goblin.goblinRunRight.keyName, // 'enemy/goblin/goblin_run_right.png'
          SpriteAnimationData.sequenced(
            amount: 6,
            stepTime: 0.1,
            textureSize: Vector2(16, 16),
          ),
        ),
      );

  static Future<SpriteAnimation> impIdleRight() => SpriteAnimation.load(
        Assets.images.enemy.imp.impIdle.keyName, // 'enemy/imp/imp_idle.png'
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.1,
          textureSize: Vector2(16, 16),
        ),
      );

  static SimpleDirectionAnimation impAnimations() => SimpleDirectionAnimation(
        idleLeft: SpriteAnimation.load(
          Assets.images.enemy.imp.impIdleLeft.keyName, // 'enemy/imp/imp_idle_left.png'
          SpriteAnimationData.sequenced(
            amount: 4,
            stepTime: 0.1,
            textureSize: Vector2(16, 16),
          ),
        ),
        idleRight: impIdleRight(),
        runLeft: SpriteAnimation.load(
          Assets.images.enemy.imp.impRunLeft.keyName, // 'enemy/imp/imp_run_left.png'
          SpriteAnimationData.sequenced(
            amount: 4,
            stepTime: 0.1,
            textureSize: Vector2(16, 16),
          ),
        ),
        runRight: SpriteAnimation.load(
          Assets.images.enemy.imp.impRunRight.keyName, // 'enemy/imp/imp_run_right.png'
          SpriteAnimationData.sequenced(
            amount: 4,
            stepTime: 0.1,
            textureSize: Vector2(16, 16),
          ),
        ),
      );

  static Future<SpriteAnimation> miniBossIdleRight() => SpriteAnimation.load(
        Assets.images.enemy.miniBoss.miniBossIdle.keyName, // 'enemy/mini_boss/mini_boss_idle.png'
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.1,
          textureSize: Vector2(16, 24),
        ),
      );

  static SimpleDirectionAnimation miniBossAnimations() =>
      SimpleDirectionAnimation(
        idleLeft: SpriteAnimation.load(
          Assets.images.enemy.miniBoss.miniBossIdleLeft.keyName, // 'enemy/mini_boss/mini_boss_idle_left.png'
          SpriteAnimationData.sequenced(
            amount: 4,
            stepTime: 0.1,
            textureSize: Vector2(16, 24),
          ),
        ),
        idleRight: miniBossIdleRight(),
        runLeft: SpriteAnimation.load(
          Assets.images.enemy.miniBoss.miniBossRunLeft.keyName, // 'enemy/mini_boss/mini_boss_run_left.png'
          SpriteAnimationData.sequenced(
            amount: 4,
            stepTime: 0.1,
            textureSize: Vector2(16, 24),
          ),
        ),
        runRight: SpriteAnimation.load(
          Assets.images.enemy.miniBoss.miniBossRunRight.keyName, // 'enemy/mini_boss/mini_boss_run_right.png'
          SpriteAnimationData.sequenced(
            amount: 4,
            stepTime: 0.1,
            textureSize: Vector2(16, 24),
          ),
        ),
      );
}
