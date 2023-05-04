import 'package:bonfire/bonfire.dart';
import 'package:fafa_runner/constrants/constrants.dart';
import 'package:fafa_runner/l10n/l10n.dart';
import 'package:fafa_runner/player/knight.dart';
import 'package:fafa_runner/util/game_sprite_sheet.dart';
import 'package:flutter/cupertino.dart';

class Door extends GameDecoration with ObjectCollision {
  Door(Vector2 position, Vector2 size)
      : super.withSprite(
          sprite: Sprite.load('items/door_closed.png'),
          position: position,
          size: size,
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: Vector2(width, height / 4),
            align: Vector2(0, height * 0.75),
          ),
        ],
      ),
    );
  }

  bool open = false;
  bool showDialog = false;

  @override
  void update(double dt) {
    super.update(dt);
    if (gameRef.player != null) {
      seeComponent(
        gameRef.player!,
        observed: (player) {
          if (!open) {
            final p = player as Knight;
            if (p.containKey == true) {
              open = true;
              gameRef.add(
                AnimatedObjectOnce(
                  animation: GameSpriteSheet.openTheDoor(),
                  position: position,
                  onFinish: () {
                    p.containKey = false;
                  },
                  size: Vector2(32, 32),
                ),
              );
              Future.delayed(
                const Duration(milliseconds: 200),
                removeFromParent,
              );
            } else {
              if (!showDialog) {
                showDialog = true;
                _showIntroduction();
              }
            }
          }
        },
        notObserved: () {
          showDialog = false;
        },
        radiusVision: tileSize,
      );
    }
  }

  void _showIntroduction() {
    TalkDialog.show(
      gameRef.context,
      [
        Say(
          text: [
            TextSpan(
              text: gameRef.context.l10n.doorWithoutKey,
            )
          ],
          person: (gameRef.player as SimplePlayer?)
                  ?.animation
                  ?.idleRight
                  ?.asWidget() ??
              const SizedBox.shrink(),
        )
      ],
    );
  }
}
