// Flutter imports:
import 'package:flutter/cupertino.dart';

// Package imports:
import 'package:bonfire/bonfire.dart';

// Project imports:
import 'package:fafarunner/i18n/i18n.dart';
import 'package:fafarunner/player/knight.dart';
import 'package:fafarunner/util/game_sprite_sheet.dart';

class Door extends GameDecoration {
  Door(Vector2 position, Vector2 size)
      : super.withSprite(
          sprite: Sprite.load('items/door_closed.png'),
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
    TalkDialog.show(
      gameRef.context,
      [
        Say(
          text: [
            TextSpan(
              text: t.pages.doorWithoutKey,
            ),
          ],
          person: (gameRef.player as SimplePlayer?)
                  ?.animation
                  ?.idleRight
                  ?.asWidget() ??
              const SizedBox.shrink(),
        ),
      ],
      onClose: () {
        showDialog = false;
      },
    );
  }
}
