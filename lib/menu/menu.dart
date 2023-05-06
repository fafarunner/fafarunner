import 'dart:async';

import 'package:bonfire/bonfire.dart' hide Timer;
import 'package:fafa_runner/constrants/get.dart';
import 'package:fafa_runner/dialog/dialog.dart';
import 'package:fafa_runner/game/game.dart';
import 'package:fafa_runner/l10n/l10n.dart';
import 'package:fafa_runner/util/custom_sprite_animation_widget.dart';
import 'package:fafa_runner/util/enemy_sprite_sheet.dart';
import 'package:fafa_runner/util/player_sprite_sheet.dart';
import 'package:fafa_runner/util/sounds.dart';
import 'package:fafa_runner/widgets/custom_radio.dart';
import 'package:flame_splash_screen/flame_splash_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:window_manager/window_manager.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> with WindowListener {
  bool showSplash = true;
  int currentPosition = 0;
  Timer? _timer;
  List<Future<SpriteAnimation>> sprites = [
    PlayerSpriteSheet.idleRight(),
    EnemySpriteSheet.goblinIdleRight(),
    EnemySpriteSheet.impIdleRight(),
    EnemySpriteSheet.miniBossIdleRight(),
    EnemySpriteSheet.bossIdleRight(),
  ];

  @override
  void initState() {
    windowManager.addListener(this);
    super.initState();
  }

  @override
  void dispose() {
    windowManager.removeListener(this);
    Sounds.stopBackgroundSound();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: showSplash ? buildSplash() : buildMenu(),
    );
  }

  Widget buildMenu() {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text(
                'FaFa Runner',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Normal',
                  fontSize: 30,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              if (sprites.isNotEmpty)
                SizedBox(
                  height: 100,
                  width: 100,
                  child: CustomSpriteAnimationWidget(
                    animation: sprites[currentPosition],
                  ),
                ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 150,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    minimumSize: const Size(100, 40), //////// HERE
                  ),
                  child: Text(
                    context.l10n.playCap,
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'Normal',
                      fontSize: 17,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Game()),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              DefectorRadio<bool>(
                value: false,
                label: 'Keyboard',
                group: Game.useJoystick,
                onChange: (value) {
                  setState(() {
                    Game.useJoystick = value;
                  });
                },
              ),
              const SizedBox(
                height: 10,
              ),
              DefectorRadio<bool>(
                value: true,
                group: Game.useJoystick,
                label: 'Joystick',
                onChange: (value) {
                  setState(() {
                    Game.useJoystick = value;
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              if (!Game.useJoystick)
                SizedBox(
                  height: 80,
                  width: 200,
                  child: Sprite.load('keyboard_tip.png').asWidget(),
                ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          height: 20,
          margin: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: context.l10n.poweredByPrefix,
                    ),
                    TextSpan(
                      text: context.l10n.author,
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          _launchURL('https://github.com/kjxbyz');
                        },
                      style: const TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.blue,
                      ),
                    ),
                    TextSpan(
                      text: context.l10n.poweredBySuffix,
                    ),
                  ],
                ),
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'Normal',
                  fontSize: 12,
                ),
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: context.l10n.builtWithPrefix,
                    ),
                    TextSpan(
                      text: 'Bonfire',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          _launchURL(
                            'https://github.com/RafaelBarbosatec/bonfire',
                          );
                        },
                      style: const TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.blue,
                      ),
                    ),
                    TextSpan(
                      text: context.l10n.builtWithSuffix,
                    ),
                  ],
                ),
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'Normal',
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSplash() {
    return FlameSplashScreen(
      theme: FlameSplashTheme.dark,
      onFinish: (BuildContext context) {
        setState(() {
          showSplash = false;
        });
        startTimer();
      },
    );
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      setState(() {
        currentPosition++;
        if (currentPosition > sprites.length - 1) {
          currentPosition = 0;
        }
      });
    });
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

  Future<void> _launchURL(String url) async {
    final _url = Uri.parse(url);
    if (await canLaunchUrl(_url)) {
      await launchUrl(_url);
    } else {
      throw Exception('Could not launch $url');
    }
  }
}
