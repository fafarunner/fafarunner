import 'package:bonfire/bonfire.dart';

import '../../gen/assets.gen.dart';

class NpcSpriteSheet {
  static Future<SpriteAnimation> kidIdleLeft() => SpriteAnimation.load(
    Assets.images.npc.kidIdleLeft.keyName, // 'npc/kid_idle_left.png'
    SpriteAnimationData.sequenced(
      amount: 4,
      stepTime: 0.1,
      textureSize: Vector2(16, 22),
    ),
  );

  static Future<SpriteAnimation> wizardIdleLeft() => SpriteAnimation.load(
    Assets.images.npc.wizardIdleLeft.keyName, // 'npc/wizard_idle_left.png'
    SpriteAnimationData.sequenced(
      amount: 4,
      stepTime: 0.1,
      textureSize: Vector2(16, 22),
    ),
  );
}
