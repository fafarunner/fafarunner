import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:bonfire/bonfire.dart';
import 'package:l10n/l10n.dart';

import '../constrants/constrants.dart';
import '../util/custom_sprite_animation_widget.dart';
import '../util/npc_sprite_sheet.dart';
import '../util/player_sprite_sheet.dart';
import '../util/sounds.dart';
import '../../gen/assets.gen.dart';

class WizardNPC extends SimpleNpc {
  WizardNPC(
    Vector2 position,
  ) : super(
          animation: SimpleDirectionAnimation(
            idleRight: NpcSpriteSheet.wizardIdleLeft(),
            runRight: NpcSpriteSheet.wizardIdleLeft(),
          ),
          position: position,
          size: Vector2(
            tileSize * 0.8,
            tileSize,
          ),
        );

  bool _showConversation = false;

  @override
  void update(double dt) {
    super.update(dt);
    if (gameRef.player != null) {
      seeComponent(
        gameRef.player!,
        observed: (player) {
          if (!_showConversation) {
            gameRef.player!.idle();
            _showConversation = true;
            _showEmote(emote: Assets.images.emote.emoteInterregacao.keyName); // 'emote/emote_interregacao.png'
            _showIntroduction();
          }
        },
        radiusVision: 2 * tileSize,
      );
    }
  }

  void _showEmote({required String emote}) {
    gameRef.add(
      AnimatedFollowerGameObject(
        animation: SpriteAnimation.load(
          emote,
          SpriteAnimationData.sequenced(
            amount: 8,
            stepTime: 0.1,
            textureSize: Vector2(32, 32),
          ),
        ),
        loop: false,
        target: this,
        offset: Vector2(18, -6),
        size: Vector2.all(tileSize / 2),
      ),
    );
  }

  void _showIntroduction() {
    final t = Translations.of(gameRef.context);
    Sounds.interaction();
    TalkDialog.show<void>(
      gameRef.context,
      [
        Say(
          text: [
            TextSpan(text: t.gamePage.talkWizard1),
          ],
          person: CustomSpriteAnimationWidget(
            animation: NpcSpriteSheet.wizardIdleLeft(),
          ),
          personSayDirection: PersonSayDirection.RIGHT,
        ),
        Say(
          text: [TextSpan(text: t.gamePage.talkPlayer1)],
          person: CustomSpriteAnimationWidget(
            animation: PlayerSpriteSheet.idleRight(),
          ),
        ),
        Say(
          text: [TextSpan(text: t.gamePage.talkWizard2)],
          person: CustomSpriteAnimationWidget(
            animation: NpcSpriteSheet.wizardIdleLeft(),
          ),
          personSayDirection: PersonSayDirection.RIGHT,
        ),
        Say(
          text: [TextSpan(text: t.gamePage.talkPlayer2)],
          person: CustomSpriteAnimationWidget(
            animation: PlayerSpriteSheet.idleRight(),
          ),
        ),
        Say(
          text: [TextSpan(text: t.gamePage.talkWizard3)],
          person: CustomSpriteAnimationWidget(
            animation: NpcSpriteSheet.wizardIdleLeft(),
          ),
          personSayDirection: PersonSayDirection.RIGHT,
        ),
      ],
      onChangeTalk: (index) {
        Sounds.interaction();
      },
      onFinish: Sounds.interaction,
      logicalKeyboardKeysToNext: [
        LogicalKeyboardKey.space,
      ],
    );
  }
}
