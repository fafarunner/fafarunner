// Flutter imports:
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:bonfire/bonfire.dart';
import 'package:get/get.dart' hide Translations;
import 'package:l10n/l10n.dart';
import 'package:shared/shared.dart';
import 'package:tray_manager/tray_manager.dart' as tray;

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
import '../controllers/settings_controller.dart';
import '../enums/enums.dart';
import '../reader/custom_tiled_asset_reader.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  static bool useJoystick = isMobile;

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game>
    with TickerProviderStateMixin, tray.TrayListener {
  late AnimationController _controller;

  @override
  void initState() {
    tray.trayManager.addListener(this);
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    Sounds.playBackgroundSound();
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timestamp) {
      initTrayMenu();
    });
  }

  @override
  void dispose() {
    tray.trayManager.removeListener(this);
    _controller.dispose();
    Sounds.stopBackgroundSound();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final controller = Get.find<SettingsController>();
    final directionalKeys = controller.directionalKeys.value;
    final attackKey = controller.attackKey.value;
    final fireKey = controller.fireKey.value;

    Widget child = ColoredBox(
      color: Colors.black,
      child: Stack(
        children: [
          Center(
            child: Text(
              t.menuPage.loading,
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
                        Sprite.load(Assets.images.joystickBackground.keyName),
                    // 'joystick_background.png'
                    spriteKnobDirectional:
                        Sprite.load(Assets.images.joystickKnob.keyName),
                    // 'joystick_knob.png'
                    size: 100,
                    isFixed: false,
                  ),
                  actions: [
                    JoystickAction(
                      actionId: 0,
                      sprite: Sprite.load(Assets.images.joystickAtack.keyName),
                      // 'joystick_atack.png'
                      spritePressed: Sprite.load(
                        Assets.images.joystickAtackSelected.keyName,
                      ),
                      // 'joystick_atack_selected.png'
                      size: 80,
                      margin: const EdgeInsets.only(bottom: 50, right: 50),
                    ),
                    JoystickAction(
                      actionId: 1,
                      sprite:
                          Sprite.load(Assets.images.joystickAtackRange.keyName),
                      // 'joystick_atack_range.png'
                      spritePressed: Sprite.load(
                        Assets.images.joystickAtackRangeSelected.keyName,
                      ),
                      // 'joystick_atack_range_selected.png'
                      margin: const EdgeInsets.only(bottom: 50, right: 160),
                    ),
                  ],
                ),
                Keyboard(
                  config: KeyboardConfig(
                    enable: !Game.useJoystick,
                    directionalKeys: [keyboardDirectionalKeys.elementAt(directionalKeys)],
                    acceptedKeys: [
                      LogicalKeyboardKey.space,
                      attackKey,
                      fireKey,
                    ],
                  ),
                ),
              ],
              player: Knight(
                Vector2(2 * tileSize, 3 * tileSize),
              ),
              map: WorldMapByTiled(
                CustomTiledAssetReader(asset: Assets.images.tiled.map),
                // 'tiled/map.json'
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
    );

    if (kIsWeb) {
      child = Title(
        title: t.appName,
        color: Colors.black,
        child: child,
      );
    }

    return child;
  }

  @override
  void onTrayIconMouseDown() {
    tray.trayManager.popUpContextMenu();
  }

  @override
  void onTrayMenuItemClick(tray.MenuItem menuItem) {
    if (menuItem.key == Menus.exit.name) {
      exit(0);
    }
  }

  Future<void> initTrayMenu() async {
    final t = Translations.of(context);
    await tray.trayManager.setIcon(
      Platform.isWindows ? Assets.trayIcon : Assets.trayLogo.keyName,
    );
    final menu = tray.Menu(
      items: [
        tray.MenuItem(
          key: Menus.exit.name,
          label: t.tray.exit,
        ),
      ],
    );
    await tray.trayManager.setContextMenu(menu);
  }
}
