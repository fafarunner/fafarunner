// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:bonfire/bonfire.dart';
import 'package:l10n/l10n.dart';
import 'package:shared/shared.dart';

// Project imports:
import 'package:game/src/constrants/constrants.dart';
import 'package:game/src/decoration/barrel.dart';
import 'package:game/src/decoration/door.dart';
import 'package:game/src/decoration/key.dart';
import 'package:game/src/decoration/potion_life.dart';
import 'package:game/src/decoration/spikes.dart';
import 'package:game/src/decoration/torch.dart';
import 'package:game/src/enemies/boss.dart';
import 'package:game/src/enemies/goblin.dart';
import 'package:game/src/enemies/imp.dart';
import 'package:game/src/enemies/mini_boss.dart';
import 'package:game/src/interface/knight_interface.dart';
import 'package:game/src/npc/kid.dart';
import 'package:game/src/npc/wizard_npc.dart';
import 'package:game/src/player/knight.dart';
import 'package:game/src/util/sounds.dart';
import 'package:game/src/widgets/game_controller.dart';
import '../../gen/assets.gen.dart';
import '../reader/custom_tiled_asset_reader.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  static bool useJoystick = isMobile;

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    Sounds.playBackgroundSound();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    Sounds.stopBackgroundSound();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);

    return Title(
      title: t.pages.appName,
      color: Colors.black,
      child: ColoredBox(
        color: Colors.black,
        child: Stack(
          children: [
            Center(
              child: Text(
                t.pages.loading,
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'Normal',
                  fontSize: 20,
                ),
              ),
            ),
            FadeTransition(
              opacity: _controller,
              child: BonfireWidget(
                playerControllers: [
                  Joystick(
                    directional: JoystickDirectional(
                      spriteBackgroundDirectional:
                          Sprite.load(Assets.images.joystickBackground.keyName), // 'joystick_background.png'
                      spriteKnobDirectional: Sprite.load(Assets.images.joystickKnob.keyName), // 'joystick_knob.png'
                      size: 100,
                      isFixed: false,
                    ),
                    actions: [
                      JoystickAction(
                        actionId: 0,
                        sprite: Sprite.load(Assets.images.joystickAtack.keyName), // 'joystick_atack.png'
                        spritePressed:
                            Sprite.load(Assets.images.joystickAtackSelected.keyName), // 'joystick_atack_selected.png'
                        size: 80,
                        margin: const EdgeInsets.only(bottom: 50, right: 50),
                      ),
                      JoystickAction(
                        actionId: 1,
                        sprite: Sprite.load(Assets.images.joystickAtackRange.keyName), // 'joystick_atack_range.png'
                        spritePressed:
                            Sprite.load(Assets.images.joystickAtackRangeSelected.keyName), // 'joystick_atack_range_selected.png'
                        margin: const EdgeInsets.only(bottom: 50, right: 160),
                      ),
                    ],
                  ),
                  Keyboard(
                    config: KeyboardConfig(
                      enable: !Game.useJoystick,
                      directionalKeys: [KeyboardDirectionalKeys.arrows()],
                      acceptedKeys: [
                        LogicalKeyboardKey.space,
                        LogicalKeyboardKey.keyZ,
                      ],
                    ),
                  ),
                ],
                player: Knight(
                  Vector2(2 * tileSize, 3 * tileSize),
                ),
                map: WorldMapByTiled(
                  CustomTiledAssetReader(asset: Assets.images.tiled.map), // 'tiled/map.json'
                  forceTileSize: Vector2(tileSize, tileSize),
                  objectsBuilder: {
                    'barrel': (p) => Barrel(p.position),
                    'door': (p) => Door(p.position, p.size),
                    'torch': (p) => Torch(p.position),
                    'potion': (p) => PotionLife(p.position, 30),
                    'wizard': (p) => WizardNPC(p.position),
                    'spikes': (p) => Spikes(p.position),
                    'key': (p) => DoorKey(p.position),
                    'kid': (p) => Kid(p.position),
                    'boss': (p) => Boss(p.position),
                    'goblin': (p) => Goblin(p.position),
                    'imp': (p) => Imp(p.position),
                    'mini_boss': (p) => MiniBoss(p.position),
                    'torch_empty': (p) => Torch(p.position, empty: true),
                  },
                ),
                components: [GameController()],
                interface: KnightInterface(),
                lightingColorGame: Colors.black.withValues(alpha: 0.6),
                backgroundColor: Colors.grey[900],
                cameraConfig: CameraConfig(
                  speed: 3,
                  zoom: getZoomFromMaxVisibleTile(context, tileSize, 18),
                ),
                onReady: (_) {
                  Future.delayed(
                    const Duration(milliseconds: 300),
                    () => _controller.forward(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
