import 'dart:math';

import 'package:bonfire/bonfire.dart';
import 'package:fafa_runner/constrants/get.dart';
import 'package:fafa_runner/decoration/door.dart';
import 'package:fafa_runner/decoration/key.dart';
import 'package:fafa_runner/decoration/potion_life.dart';
import 'package:fafa_runner/decoration/spikes.dart';
import 'package:fafa_runner/decoration/torch.dart';
import 'package:fafa_runner/enemies/boss.dart';
import 'package:fafa_runner/enemies/goblin.dart';
import 'package:fafa_runner/enemies/imp.dart';
import 'package:fafa_runner/enemies/mini_boss.dart';
import 'package:fafa_runner/interface/knight_interface.dart';
import 'package:fafa_runner/menu/linux_dialog.dart';
import 'package:fafa_runner/menu/macos_dialog.dart';
import 'package:fafa_runner/menu/window_dialog.dart';
import 'package:fafa_runner/npc/kid.dart';
import 'package:fafa_runner/npc/wizard_npc.dart';
import 'package:fafa_runner/player/knight.dart';
import 'package:fafa_runner/util/dialogs.dart';
import 'package:fafa_runner/util/sounds.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:window_manager/window_manager.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  static bool useJoystick = isMobile;

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> with GameListener, WindowListener {
  bool showGameOver = false;

  late GameController _controller;

  @override
  void initState() {
    windowManager.addListener(this);
    _controller = GameController()..addListener(this);
    Sounds.playBackgroundSound();
    super.initState();
  }

  @override
  void dispose() {
    windowManager.removeListener(this);
    Sounds.stopBackgroundSound();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;
    final tileSize = max(sizeScreen.height, sizeScreen.width) / 15;

    var joystick = Joystick(
      directional: JoystickDirectional(
        spriteBackgroundDirectional: Sprite.load('joystick_background.png'),
        spriteKnobDirectional: Sprite.load('joystick_knob.png'),
        size: 100,
        isFixed: false,
      ),
      actions: [
        JoystickAction(
          actionId: 0,
          sprite: Sprite.load('joystick_atack.png'),
          spritePressed: Sprite.load('joystick_atack_selected.png'),
          size: 80,
          margin: const EdgeInsets.only(bottom: 50, right: 50),
        ),
        JoystickAction(
          actionId: 1,
          sprite: Sprite.load('joystick_atack_range.png'),
          spritePressed: Sprite.load('joystick_atack_range_selected.png'),
          margin: const EdgeInsets.only(bottom: 50, right: 160),
        )
      ],
    );
    if (!Game.useJoystick) {
      joystick = Joystick(
        keyboardConfig: KeyboardConfig(
          keyboardDirectionalType: KeyboardDirectionalType.wasdAndArrows,
          acceptedKeys: [
            LogicalKeyboardKey.space,
            LogicalKeyboardKey.keyZ,
          ],
        ),
      );
    }

    return Material(
      color: Colors.transparent,
      child: BonfireWidget(
        gameController: _controller,
        joystick: joystick,
        player: Knight(
          Vector2(2 * tileSize, 3 * tileSize),
        ),
        map: WorldMapByTiled(
          'tiled/map.json',
          forceTileSize: Vector2(tileSize, tileSize),
          objectsBuilder: {
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
        interface: KnightInterface(),
        lightingColorGame: Colors.black.withOpacity(0.6),
        background: BackgroundColorGame(Colors.grey[900]!),
        progress: const ColoredBox(
          color: Colors.black,
          child: Center(
            child: Text(
              'Loading...',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Normal',
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showDialogGameOver() {
    setState(() {
      showGameOver = true;
    });
    Dialogs.showGameOver(
      context,
      () {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => Game()),
          (Route<dynamic> route) => false,
        );
      },
    );
  }

  @override
  void changeCountLiveEnemies(int count) {}

  @override
  void updateGame() {
    if (_controller.player != null && _controller.player?.isDead == true) {
      if (!showGameOver) {
        showGameOver = true;
        _showDialogGameOver();
      }
    }
  }

  @override
  Future<void> onWindowClose() async {
    final _isPreventClose = await windowManager.isPreventClose();
    if (isDesktop && _isPreventClose) {
      if (defaultTargetPlatform == TargetPlatform.windows) {
        await showWindowDialog(context);
      } else if (defaultTargetPlatform == TargetPlatform.macOS) {
        await showMacosDialog(context);
      } else if (defaultTargetPlatform == TargetPlatform.linux) {
        await showLinuxDialog(context);
      }
    }
  }
}
