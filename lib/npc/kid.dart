import 'package:bonfire/bonfire.dart';
import 'package:fafa_runner/enemies/boss.dart';
import 'package:fafa_runner/l10n/l10n.dart';
import 'package:fafa_runner/util/custom_sprite_animation_widget.dart';
import 'package:fafa_runner/util/dialogs.dart';
import 'package:fafa_runner/util/functions.dart';
import 'package:fafa_runner/util/npc_sprite_sheet.dart';
import 'package:fafa_runner/util/player_sprite_sheet.dart';
import 'package:fafa_runner/util/sounds.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Kid extends GameDecoration {
  Kid(
    Vector2 position,
  ) : super.withAnimation(
          animation: NpcSpriteSheet.kidIdleLeft(),
          position: position,
          size: Vector2(valueByTileSize(8), valueByTileSize(11)),
        );

  bool conversationWithHero = false;

  @override
  void update(double dt) {
    super.update(dt);
    if (!conversationWithHero && checkInterval('checkBossDead', 1000, dt)) {
      try {
        gameRef.enemies().firstWhere((e) => e is Boss);
      } catch (e) {
        conversationWithHero = true;
        gameRef.camera.moveToTargetAnimated(
          target: this,
          onComplete: () {
            _startConversation();
          },
        );
      }
    }
  }

  void _startConversation() {
    Sounds.interaction();
    TalkDialog.show(
      gameRef.context,
      [
        Say(
          text: [TextSpan(text: gameRef.context.l10n.talkKid2)],
          person: CustomSpriteAnimationWidget(
            animation: NpcSpriteSheet.kidIdleLeft(),
          ),
          personSayDirection: PersonSayDirection.RIGHT,
        ),
        Say(
          text: [TextSpan(text: gameRef.context.l10n.talkPlayer4)],
          person: CustomSpriteAnimationWidget(
            animation: PlayerSpriteSheet.idleRight(),
          ),
        ),
      ],
      onFinish: () {
        Sounds.interaction();
        gameRef.camera.moveToPlayerAnimated(
          onComplete: () {
            Dialogs.showCongratulations(gameRef.context);
          },
        );
      },
      onChangeTalk: (index) {
        Sounds.interaction();
      },
      logicalKeyboardKeysToNext: [
        LogicalKeyboardKey.space,
      ],
    );
  }
}
