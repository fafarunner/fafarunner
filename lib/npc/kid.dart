// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:bonfire/bonfire.dart';

// Project imports:
import 'package:fafarunner/enemies/boss.dart';
import 'package:fafarunner/i18n/i18n.dart';
import 'package:fafarunner/util/custom_sprite_animation_widget.dart';
import 'package:fafarunner/util/dialogs.dart';
import 'package:fafarunner/util/functions.dart';
import 'package:fafarunner/util/npc_sprite_sheet.dart';
import 'package:fafarunner/util/player_sprite_sheet.dart';
import 'package:fafarunner/util/sounds.dart';

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
    TalkDialog.show(
      gameRef.context,
      [
        Say(
          text: [TextSpan(text: t.pages.talkKid2)],
          person: CustomSpriteAnimationWidget(
            animation: NpcSpriteSheet.kidIdleLeft(),
          ),
          personSayDirection: PersonSayDirection.RIGHT,
        ),
        Say(
          text: [TextSpan(text: t.pages.talkPlayer4)],
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
