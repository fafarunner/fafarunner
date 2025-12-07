import 'package:flutter/cupertino.dart';

import 'package:bonfire/bonfire.dart';
import 'package:l10n/l10n.dart';

import '../player/knight.dart';
import '../util/game_sprite_sheet.dart';
import '../util/player_sprite_sheet.dart';
import '../../gen/assets.gen.dart';

class Door extends GameDecoration {
  Door(Vector2 position, Vector2 size)
      : super.withSprite(
          sprite: Sprite.load(Assets.images.items.doorClosed.keyName), // 'items/door_closed.png'
          position: position,
          size: size,
        );

  bool open = false;
  bool showDialog = false;

  @override
  Future<void> onLoad() {
    add(
      RectangleHitbox(
        size: Vector2(width, height / 4),
        position: Vector2(0, height * 0.75),
      ),
    );
    return super.onLoad();
  }

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    if (other is Knight) {
      if (!open) {
        final p = other;
        if (p.containKey == true) {
          open = true;
          p.containKey = false;
          playSpriteAnimationOnce(
            GameSpriteSheet.openTheDoor(),
            onFinish: removeFromParent,
            onStart: () {
              sprite = null;
            },
          );
        } else {
          if (!showDialog) {
            showDialog = true;
            _showIntroduction();
          }
        }
      }
    }
    super.onCollisionStart(intersectionPoints, other);
  }

  void _showIntroduction() {
    final t = Translations.of(gameRef.context);
    TalkDialog.show<void>(
      gameRef.context,
      [
        Say(
          text: [
            TextSpan(
              text: t.gamePage.doorWithoutKey,
            ),
          ],
          person: PlayerSpriteSheet.idleRight().asWidget(),
        ),
      ],
      onClose: () {
        showDialog = false;
      },
    );
  }
}
