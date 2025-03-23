// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:bonfire/bonfire.dart';
import 'package:l10n/l10n.dart';

// Project imports:
import '../enemies/boss.dart';
import '../util/custom_sprite_animation_widget.dart';
import '../util/dialogs.dart';
import '../util/functions.dart';
import '../util/npc_sprite_sheet.dart';
import '../util/player_sprite_sheet.dart';
import '../util/sounds.dart';

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
      } on Exception catch (_) {
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
    final t = Translations.of(gameRef.context);
    Sounds.interaction();
    TalkDialog.show<void>(
      gameRef.context,
      [
        Say(
          text: [TextSpan(text: t.gamePage.talkKid2)],
          person: CustomSpriteAnimationWidget(
            animation: NpcSpriteSheet.kidIdleLeft(),
          ),
          personSayDirection: PersonSayDirection.RIGHT,
        ),
        Say(
          text: [TextSpan(text: t.gamePage.talkPlayer4)],
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
