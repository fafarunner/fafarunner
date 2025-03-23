// Dart imports:
import 'dart:async' as async;

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:bonfire/bonfire.dart';
import 'package:get/get.dart';

// Project imports:
import '../constrants/constrants.dart';
import '../controllers/settings_controller.dart';
import '../util/functions.dart';
import '../util/game_sprite_sheet.dart';
import '../util/player_sprite_sheet.dart';
import '../util/sounds.dart';
import '../../gen/assets.gen.dart';

class Knight extends SimplePlayer with Lighting, BlockMovementCollision {
  Knight(Vector2 position)
      : super(
          animation: PlayerSpriteSheet.playerAnimations(),
          size: Vector2.all(tileSize),
          position: position,
          life: 200,
          speed: tileSize * 2.5,
        ) {
    setupLighting(
      LightingConfig(
        radius: width * 1.5,
        blurBorder: width,
        color: Colors.deepOrangeAccent.withValues(alpha: 0.2),
      ),
    );
    setupMovementByJoystick(
      intensityEnabled: true,
    );
  }

  double attack = 25;
  double stamina = 100;
  async.Timer? _timerStamina;
  bool containKey = false;
  bool showObserveEnemy = false;
  final controller = Get.find<SettingsController>();

  @override
  async.Future<void> onLoad() {
    add(
      RectangleHitbox(
        size: Vector2(valueByTileSize(8), valueByTileSize(8)),
        position: Vector2(
          valueByTileSize(4),
          valueByTileSize(8),
        ),
      ),
    );
    return super.onLoad();
  }

  @override
  void onJoystickAction(JoystickActionEvent event) {
    final attackKey = controller.attackKey.value.logicalKey;
    final fireKey = controller.fireKey.value.logicalKey;

    if (event.id == 0 && event.event == ActionEvent.DOWN) {
      actionAttack();
    }

    if (event.id == attackKey && event.event == ActionEvent.DOWN) {
      actionAttack();
    }

    if (event.id == fireKey && event.event == ActionEvent.DOWN) {
      actionAttackRange();
    }

    if (event.id == 1 && event.event == ActionEvent.DOWN) {
      actionAttackRange();
    }
    super.onJoystickAction(event);
  }

  @override
  void onDie() {
    removeFromParent();
    gameRef.add(
      GameDecoration.withSprite(
        sprite: Sprite.load(Assets.images.player.playerCrypt.keyName),
        // 'player/player_crypt.png'
        position: Vector2(
          position.x,
          position.y,
        ),
        size: Vector2.all(30),
      ),
    );
    super.onDie();
  }

  void actionAttack() {
    if (stamina < 15) {
      return;
    }

    Sounds.attackPlayerMelee();
    decrementStamina(15);
    simpleAttackMelee(
      damage: attack,
      animationRight: PlayerSpriteSheet.attackEffectRight(),
      size: Vector2.all(tileSize),
    );
  }

  void actionAttackRange() {
    if (stamina < 10) {
      return;
    }

    Sounds.attackRange();

    decrementStamina(10);
    simpleAttackRange(
      animationRight: GameSpriteSheet.fireBallAttackRight(),
      animationDestroy: GameSpriteSheet.fireBallExplosion(),
      size: Vector2(tileSize * 0.65, tileSize * 0.65),
      damage: 10,
      speed: speed * 2.5,
      onDestroy: Sounds.explosion,
      collision: RectangleHitbox(
        size: Vector2(tileSize / 3, tileSize / 3),
        position: Vector2(10, 5),
      ),
      lightingConfig: LightingConfig(
        radius: tileSize * 0.9,
        blurBorder: tileSize / 2,
        color: Colors.deepOrangeAccent.withValues(alpha: 0.4),
      ),
    );
  }

  @override
  void update(double dt) {
    if (isDead) return;
    _verifyStamina();
    seeEnemy(
      radiusVision: tileSize * 6,
      notObserved: () {
        showObserveEnemy = false;
      },
      observed: (enemies) {
        if (showObserveEnemy) return;
        showObserveEnemy = true;
        _showEmote(
          emote: Assets.images.emote.emoteExclamacao.keyName,
        ); // 'emote/emote_exclamacao.png'
      },
    );
    super.update(dt);
  }

  void _verifyStamina() {
    if (_timerStamina == null) {
      _timerStamina = async.Timer(const Duration(milliseconds: 150), () {
        _timerStamina = null;
      });
    } else {
      return;
    }

    stamina += 2;
    if (stamina > 100) {
      stamina = 100;
    }
  }

  void decrementStamina(int i) {
    stamina -= i;
    if (stamina < 0) {
      stamina = 0;
    }
  }

  @override
  void onReceiveDamage(
    AttackOriginEnum attacker,
    double damage,
    dynamic identify,
  ) {
    if (isDead) return;
    showDamage(
      damage,
      config: TextStyle(
        fontSize: valueByTileSize(5),
        color: Colors.orange,
        fontFamily: 'Normal',
      ),
    );
    super.onReceiveDamage(attacker, damage, identify);
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
        target: this,
        loop: false,
        size: Vector2.all(tileSize / 2),
        offset: Vector2(18, -6),
      ),
    );
  }
}
