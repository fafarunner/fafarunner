import 'package:bonfire/bonfire.dart';
import 'package:fafa_runner/constrants/constrants.dart';
import 'package:fafa_runner/util/enemy_sprite_sheet.dart';
import 'package:fafa_runner/util/functions.dart';
import 'package:fafa_runner/util/game_sprite_sheet.dart';
import 'package:fafa_runner/util/sounds.dart';
import 'package:flutter/material.dart';

class MiniBoss extends SimpleEnemy with ObjectCollision, UseBarLife {
  MiniBoss(this.initPosition)
      : super(
          animation: EnemySpriteSheet.miniBossAnimations(),
          position: initPosition,
          size: Vector2(tileSize * 0.68, tileSize * 0.93),
          speed: tileSize / 0.35,
          life: 150,
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: Vector2(valueByTileSize(6), valueByTileSize(7)),
            align: Vector2(valueByTileSize(2.5), valueByTileSize(8)),
          ),
        ],
      ),
    );
  }

  final Vector2 initPosition;
  double attack = 50;
  bool _seePlayerClose = false;

  @override
  void update(double dt) {
    super.update(dt);
    _seePlayerClose = false;
    seePlayer(
      observed: (player) {
        _seePlayerClose = true;
        seeAndMoveToPlayer(
          closePlayer: (player) {
            execAttack();
          },
          radiusVision: tileSize * 3,
        );
      },
      radiusVision: tileSize * 3,
    );
    if (!_seePlayerClose) {
      seeAndMoveToAttackRange(
        positioned: (p) {
          execAttackRange();
        },
        radiusVision: tileSize * 5,
      );
    }
  }

  @override
  void die() {
    gameRef.add(
      AnimatedObjectOnce(
        animation: GameSpriteSheet.smokeExplosion(),
        position: position,
        size: Vector2(32, 32),
      ),
    );
    removeFromParent();
    super.die();
  }

  void execAttackRange() {
    simpleAttackRange(
      animationRight: GameSpriteSheet.fireBallAttackRight(),
      animationDestroy: GameSpriteSheet.fireBallExplosion(),
      size: Vector2.all(tileSize * 0.65),
      damage: attack,
      speed: speed * (tileSize / 32),
      execute: Sounds.attackRange,
      onDestroy: Sounds.explosion,
      collision: CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: Vector2(tileSize / 2, tileSize / 2),
          ),
        ],
      ),
      lightingConfig: LightingConfig(
        radius: tileSize * 0.9,
        blurBorder: tileSize / 2,
        color: Colors.deepOrangeAccent.withOpacity(0.4),
      ),
    );
  }

  void execAttack() {
    simpleAttackMelee(
      size: Vector2.all(tileSize * 0.62),
      damage: attack / 3,
      interval: 300,
      animationRight: EnemySpriteSheet.enemyAttackEffectRight(),
      execute: Sounds.attackEnemyMelee,
    );
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
