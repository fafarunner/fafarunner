// Package imports:
import 'package:flame_audio/flame_audio.dart';

import '../../gen/assets.gen.dart';

class Sounds {
  static Future<void> initialize() async {
    FlameAudio.bgm.initialize();
    FlameAudio.updatePrefix('');
    await FlameAudio.audioCache.loadAll([
      Assets.audio.attackPlayer, // 'attack_player.mp3'
      Assets.audio.attackFireBall, // 'attack_fire_ball.wav'
      Assets.audio.attackEnemy, // 'attack_enemy.mp3'
      Assets.audio.explosion, // 'explosion.wav'
      Assets.audio.soundInteraction, // 'sound_interaction.wav'
    ]);
  }

  static void attackPlayerMelee() {
    FlameAudio.play(Assets.audio.attackPlayer, volume: 0.4); // 'attack_player.mp3'
  }

  static void attackRange() {
    FlameAudio.play(Assets.audio.attackFireBall, volume: 0.3); // 'attack_fire_ball.wav'
  }

  static void attackEnemyMelee() {
    FlameAudio.play(Assets.audio.attackEnemy, volume: 0.4); // 'attack_enemy.mp3'
  }

  static void explosion() {
    FlameAudio.play(Assets.audio.explosion); // 'explosion.wav'
  }

  static void interaction() {
    FlameAudio.play(Assets.audio.soundInteraction, volume: 0.4); // 'sound_interaction.wav'
  }

  static Future<void> stopBackgroundSound() {
    return FlameAudio.bgm.stop();
  }

  static Future<void> playBackgroundSound() async {
    await FlameAudio.bgm.stop();
    await FlameAudio.bgm.play(Assets.audio.soundBg); // 'sound_bg.mp3'
  }

  static void playBackgroundBoosSound() {
    FlameAudio.bgm.play(Assets.audio.battleBoss); // 'battle_boss.mp3'
  }

  static void pauseBackgroundSound() {
    FlameAudio.bgm.pause();
  }

  static void resumeBackgroundSound() {
    FlameAudio.bgm.resume();
  }

  static void dispose() {
    FlameAudio.bgm.dispose();
  }
}
