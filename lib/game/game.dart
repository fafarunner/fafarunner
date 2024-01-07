import 'package:bonfire/bonfire.dart';
import 'package:fafa_runner/constrants/constrants.dart';
import 'package:fafa_runner/constrants/get.dart';
import 'package:fafa_runner/decoration/door.dart';
import 'package:fafa_runner/decoration/key.dart';
import 'package:fafa_runner/decoration/potion_life.dart';
import 'package:fafa_runner/decoration/spikes.dart';
import 'package:fafa_runner/decoration/torch.dart';
import 'package:fafa_runner/dialog/dialog.dart';
import 'package:fafa_runner/enemies/boss.dart';
import 'package:fafa_runner/enemies/goblin.dart';
import 'package:fafa_runner/enemies/imp.dart';
import 'package:fafa_runner/enemies/mini_boss.dart';
import 'package:fafa_runner/interface/knight_interface.dart';
import 'package:fafa_runner/l10n/l10n.dart';
import 'package:fafa_runner/npc/kid.dart';
import 'package:fafa_runner/npc/wizard_npc.dart';
import 'package:fafa_runner/player/knight.dart';
import 'package:fafa_runner/util/sounds.dart';
import 'package:fafa_runner/widgets/game_controller.dart';
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

class _GameState extends State<Game> with WindowListener {
  @override
  void initState() {
    windowManager.addListener(this);
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
        ),
      ],
    );
    if (!Game.useJoystick) {
      joystick = Joystick(
        keyboardConfig: KeyboardConfig(
          directionalKeys: KeyboardDirectionalKeys.arrows(),
          acceptedKeys: [
            LogicalKeyboardKey.space,
            LogicalKeyboardKey.keyZ,
          ],
        ),
      );
    }

    return Title(
      title: context.l10n.appName,
      color: Colors.black,
      child: Material(
        color: Colors.transparent,
        child: BonfireWidget(
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
          components: [GameController()],
          interface: KnightInterface(),
          lightingColorGame: Colors.black.withOpacity(0.6),
          backgroundColor: Colors.grey[900],
          cameraConfig: CameraConfig(
            speed: 3,
            zoom: getZoomFromMaxVisibleTile(context, tileSize, 18),
          ),
          progress: ColoredBox(
            color: Colors.black,
            child: Center(
              child: Text(
                context.l10n.loading,
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'Normal',
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Future<void> onWindowClose() async {
    final isPreventClose = await windowManager.isPreventClose();
    if (isDesktop && isPreventClose) {
      if (!mounted) return;
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
