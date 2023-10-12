import 'package:bonfire/bonfire.dart';
import 'package:fafa_runner/constrants/constrants.dart';
import 'package:fafa_runner/util/enemy_sprite_sheet.dart';
import 'package:fafa_runner/util/functions.dart';
import 'package:fafa_runner/util/game_sprite_sheet.dart';
import 'package:fafa_runner/util/sounds.dart';
import 'package:flutter/material.dart';

class Imp extends SimpleEnemy with BlockMovementCollision, UseLifeBar {
  final Vector2 initPosition;
  double attack = 10;

  Imp(this.initPosition)
      : super(
          animation: EnemySpriteSheet.impAnimations(),
          position: initPosition,
          size: Vector2.all(tileSize * 0.8),
          speed: tileSize * 2,
          life: 80,
        );

  @override
  Future<void> onLoad() {
    add(
      RectangleHitbox(
        size: Vector2(
          valueByTileSize(6),
          valueByTileSize(6),
        ),
        position: Vector2(
          valueByTileSize(3),
          valueByTileSize(5),
        ),
      ),
    );
    return super.onLoad();
  }

  @override
  void update(double dt) {
    super.update(dt);
    seeAndMoveToPlayer(
      radiusVision: tileSize * 5,
      closePlayer: (player) {
        execAttack();
      },
    );
  }

  void execAttack() {
    simpleAttackMelee(
      size: Vector2.all(tileSize * 0.62),
      damage: attack,
      interval: 300,
      animationRight: EnemySpriteSheet.enemyAttackEffectRight(),
      execute: Sounds.attackEnemyMelee,
    );
  }

  @override
  void die() {
    gameRef.add(
      AnimatedGameObject(
        animation: GameSpriteSheet.smokeExplosion(),
        position: position,
        size: Vector2(32, 32),
        loop: false,
      ),
    );
    removeFromParent();
    super.die();
  }

  @override
  void receiveDamage(AttackFromEnum attacker, double damage, dynamic id) {
    showDamage(
      damage,
      config: TextStyle(
        fontSize: valueByTileSize(5),
        color: Colors.white,
        fontFamily: 'Normal',
      ),
    );
    super.receiveDamage(attacker, damage, id);
  }
}
