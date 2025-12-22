import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:bonfire/bonfire.dart';
import 'package:l10n/l10n.dart';

import '../constrants/constrants.dart';
import '../enemies/imp.dart';
import '../enemies/mini_boss.dart';
import '../util/custom_sprite_animation_widget.dart';
import '../util/enemy_sprite_sheet.dart';
import '../util/functions.dart';
import '../util/game_sprite_sheet.dart';
import '../util/npc_sprite_sheet.dart';
import '../util/player_sprite_sheet.dart';
import '../util/sounds.dart';

class Boss extends SimpleEnemy with BlockMovementCollision, UseLifeBar {
  Boss(this.initPosition)
    : super(
        animation: EnemySpriteSheet.bossAnimations(),
        position: initPosition,
        size: Vector2(tileSize * 1.5, tileSize * 1.7),
        speed: tileSize * 1.5,
        life: 200,
      );

  final Vector2 initPosition;
  double attack = 40;

  bool addChild = false;
  bool firstSeePlayer = false;
  List<Enemy> childrenEnemy = [];

  @override
  Future<void> onLoad() {
    add(
      RectangleHitbox(
        size: Vector2(valueByTileSize(14), valueByTileSize(16)),
        position: Vector2(valueByTileSize(5), valueByTileSize(11)),
      ),
    );
    return super.onLoad();
  }

  @override
  void render(Canvas canvas) {
    drawBarSummonEnemy(canvas);
    super.render(canvas);
  }

  @override
  void update(double dt) {
    if (!firstSeePlayer) {
      seePlayer(
        observed: (p) {
          firstSeePlayer = true;
          gameRef.camera.moveToTargetAnimated(
            target: this,
            zoom: 2,
            onComplete: _showConversation,
          );
        },
        radiusVision: tileSize * 6,
      );
    }

    if (life < 150 && childrenEnemy.isEmpty) {
      addChildInMap(dt);
    }
    if (life < 100 && childrenEnemy.length == 1) {
      addChildInMap(dt);
    }
    if (life < 50 && childrenEnemy.length == 2) {
      addChildInMap(dt);
    }
    seeAndMoveToPlayer(
      closePlayer: (player) {
        execAttack();
      },
      radiusVision: tileSize * 4,
    );

    super.update(dt);
  }

  @override
  void onDie() {
    gameRef.add(
      AnimatedGameObject(
        animation: GameSpriteSheet.explosion(),
        position: position,
        size: Vector2(32, 32),
        loop: false,
      ),
    );
    for (final e in childrenEnemy) {
      if (!e.isDead) e.onDie();
    }
    removeFromParent();
    super.onDie();
  }

  void addChildInMap(double dt) {
    if (checkInterval('addChild', 2000, dt)) {
      var positionExplosion = Vector2.zero();

      final direction = directionThePlayerIsIn();
      if (direction == Direction.left) {
        positionExplosion = position.translated(width * -2, 0);
      } else if (direction == Direction.right) {
        positionExplosion = position.translated(width * 2, 0);
      } else if (direction == Direction.up) {
        positionExplosion = position.translated(0, height * -2);
      } else if (direction == Direction.down) {
        positionExplosion = position.translated(0, height * 2);
      }

      final Enemy e = childrenEnemy.length == 2
          ? MiniBoss(Vector2(positionExplosion.x, positionExplosion.y))
          : Imp(Vector2(positionExplosion.x, positionExplosion.y));

      gameRef.add(
        AnimatedGameObject(
          animation: GameSpriteSheet.smokeExplosion(),
          position: positionExplosion,
          size: Vector2(32, 32),
          loop: false,
        ),
      );

      childrenEnemy.add(e);
      gameRef.add(e);
    }
  }

  void execAttack() {
    simpleAttackMelee(
      size: Vector2.all(tileSize * 0.62),
      damage: attack,
      interval: 1500,
      animationRight: EnemySpriteSheet.enemyAttackEffectRight(),
      execute: Sounds.attackEnemyMelee,
    );
  }

  @override
  void onReceiveDamage(
    AttackOriginEnum attacker,
    double damage,
    dynamic identify,
  ) {
    showDamage(
      damage,
      config: TextStyle(
        fontSize: valueByTileSize(5),
        color: Colors.white,
        fontFamily: 'Normal',
      ),
    );
    super.onReceiveDamage(attacker, damage, identify);
  }

  void drawBarSummonEnemy(Canvas canvas) {
    const yPosition = 0.0;
    final widthBar = (width - 10) / 3;
    if (childrenEnemy.isEmpty) {
      canvas.drawLine(
        Offset.zero,
        Offset(widthBar, yPosition),
        Paint()
          ..color = Colors.orange
          ..strokeWidth = 1
          ..style = PaintingStyle.fill,
      );
    }

    var lastX = widthBar + 5;
    if (childrenEnemy.length < 2) {
      canvas.drawLine(
        Offset(lastX, yPosition),
        Offset(lastX + widthBar, yPosition),
        Paint()
          ..color = Colors.orange
          ..strokeWidth = 1
          ..style = PaintingStyle.fill,
      );
    }

    lastX = lastX + widthBar + 5;
    if (childrenEnemy.length < 3) {
      canvas.drawLine(
        Offset(lastX, yPosition),
        Offset(lastX + widthBar, yPosition),
        Paint()
          ..color = Colors.orange
          ..strokeWidth = 1
          ..style = PaintingStyle.fill,
      );
    }
  }

  void _showConversation() {
    final t = Translations.of(gameRef.context);
    Sounds.interaction();
    TalkDialog.show<void>(
      gameRef.context,
      [
        Say(
          text: [TextSpan(text: t.gamePage.talkKid1)],
          person: CustomSpriteAnimationWidget(
            animation: NpcSpriteSheet.kidIdleLeft(),
          ),
          personSayDirection: PersonSayDirection.RIGHT,
        ),
        Say(
          text: [TextSpan(text: t.gamePage.talkBoss1)],
          person: CustomSpriteAnimationWidget(
            animation: EnemySpriteSheet.bossIdleRight(),
          ),
        ),
        Say(
          text: [TextSpan(text: t.gamePage.talkPlayer3)],
          person: CustomSpriteAnimationWidget(
            animation: PlayerSpriteSheet.idleRight(),
          ),
        ),
        Say(
          text: [TextSpan(text: t.gamePage.talkBoss2)],
          person: CustomSpriteAnimationWidget(
            animation: EnemySpriteSheet.bossIdleRight(),
          ),
          personSayDirection: PersonSayDirection.RIGHT,
        ),
      ],
      onFinish: () {
        Sounds.interaction();
        addInitChild();
        Future.delayed(const Duration(milliseconds: 500), () {
          gameRef.camera.moveToPlayerAnimated(zoom: 1);
          Sounds.playBackgroundBoosSound();
        });
      },
      onChangeTalk: (index) {
        Sounds.interaction();
      },
      logicalKeyboardKeysToNext: [LogicalKeyboardKey.space],
    );
  }

  void addInitChild() {
    addImp(width * -2, 0);
    addImp(width * -2, width);
  }

  void addImp(double x, double y) {
    final p = position.translated(x, y);
    gameRef
      ..add(
        AnimatedGameObject(
          animation: GameSpriteSheet.smokeExplosion(),
          position: p,
          size: Vector2.all(tileSize),
          loop: false,
        ),
      )
      ..add(Imp(p));
  }
}
