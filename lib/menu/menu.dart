// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:bonfire/bonfire.dart' hide Timer;
import 'package:flame_splash_screen/flame_splash_screen.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:url_launcher/url_launcher.dart';

// Project imports:
import 'package:fafarunner/config/manager.dart';
import 'package:fafarunner/constrants/get.dart';
import 'package:fafarunner/game/game.dart';
import 'package:fafarunner/i18n/i18n.dart';
import 'package:fafarunner/util/custom_sprite_animation_widget.dart';
import 'package:fafarunner/util/enemy_sprite_sheet.dart';
import 'package:fafarunner/util/player_sprite_sheet.dart';
import 'package:fafarunner/util/sounds.dart';
import 'package:fafarunner/widgets/custom_radio.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
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
  void dispose() {
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
    final t = Translations.of(context);
    final version = AppManager.instance.version;
    final buildNumber = AppManager.instance.buildNumber;
    return Title(
      title: t.pages.appName,
      color: Colors.black,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  t.pages.appName,
                  style: const TextStyle(
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
                      t.pages.playCap,
                      style: const TextStyle(
                        color: Colors.blue,
                        fontFamily: 'Normal',
                        fontSize: 17,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (context) => const Game(),
                        ),
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
                        text: t.pages.poweredByPrefix,
                      ),
                      TextSpan(
                        text: t.pages.author,
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
                        text: t.pages.poweredBySuffix,
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
                        text: t.pages.version(version: '$version+$buildNumber'),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            _launchURL(
                              'https://github.com/fafarunner/fafarunner/releases',
                            );
                          },
                        style: const TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.blue,
                        ),
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
      ),
    );
  }

  Widget buildSplash() {
    final t = Translations.of(context);
    return Title(
      title: t.pages.appName,
      color: Colors.black,
      child: FlameSplashScreen(
        theme: FlameSplashTheme(
          backgroundDecoration: const BoxDecoration(color: Colors.black),
          logoBuilder: (context) => LayoutBuilder(
            builder: (context, constraints) {
              return ConstrainedBox(
                constraints: BoxConstraints.loose(const Size(300, 300)),
                child: Image.asset('logo/logo_round.png'),
              );
            },
          ),
        ),
        onFinish: (BuildContext context) {
          setState(() {
            showSplash = false;
          });
          if (isSplashSupported) {
            FlutterNativeSplash.remove();
          }
          startTimer();
        },
      ),
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

  Future<void> _launchURL(String url) async {
    final url0 = Uri.parse(url);
    if (await canLaunchUrl(url0)) {
      await launchUrl(url0);
    } else {
      throw Exception('Could not launch $url');
    }
  }
}
