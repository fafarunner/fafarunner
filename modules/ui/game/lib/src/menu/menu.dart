// Dart imports:
import 'dart:async';
import 'dart:io';

// Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:app/app.dart';
import 'package:bonfire/bonfire.dart' hide Timer;
import 'package:flame_splash_screen/flame_splash_screen.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:game/src/util/navigator_util.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart' hide Translations;
import 'package:hotkey_manager/hotkey_manager.dart';
import 'package:l10n/l10n.dart';
import 'package:logger/logger.dart';
import 'package:shared/shared.dart';
import 'package:theme/theme.dart';
import 'package:tray_manager/tray_manager.dart' as tray;

// Project imports:
import '../../game.dart';
import '../game/game.dart';
import '../util/custom_sprite_animation_widget.dart';
import '../util/dialogs.dart';
import '../util/enemy_sprite_sheet.dart';
import '../util/player_sprite_sheet.dart';
import '../widgets/custom_radio.dart';
import '../../gen/assets.gen.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> with tray.TrayListener {
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
    tray.trayManager.addListener(this);
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timestamp) {
      initTrayMenu();
    });
    registerHotkeys();
  }

  @override
  void dispose() {
    tray.trayManager.removeListener(this);
    Sounds.stopBackgroundSound();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget child = AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: showSplash ? buildSplash() : buildMenu(),
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

  Widget buildMenu() {
    final t = Translations.of(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                t.appName,
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'Normal',
                  fontSize: 30,
                ),
              ),
              const Gap(20),
              if (sprites.isNotEmpty)
                SizedBox(
                  height: 100,
                  width: 100,
                  child: CustomSpriteAnimationWidget(
                    animation: sprites[currentPosition],
                  ),
                ),
              const Gap(30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  fixedSize: const Size(150, 40),
                  padding: EdgeInsets.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Text(
                  t.menuPage.playCap,
                  style: const TextStyle(
                    color: Colors.blue,
                    fontFamily: 'Normal',
                    fontSize: 17,
                    height: 1,
                  ),
                ),
                onPressed: () {
                  NavigatorUtil.pushAndRemoveUntil(const Game());
                },
              ),
              const Gap(20),
              DefectorRadio<bool>(
                value: false,
                label: t.menuPage.keyboard,
                group: Game.useJoystick,
                onChange: (value) {
                  setState(() {
                    Game.useJoystick = value;
                  });
                },
              ),
              const Gap(10),
              DefectorRadio<bool>(
                value: true,
                group: Game.useJoystick,
                label: t.menuPage.joystick,
                onChange: (value) {
                  setState(() {
                    Game.useJoystick = value;
                  });
                },
              ),
              const Gap(20),
              if (!Game.useJoystick)
                const KeyTips(onKeySelected: Dialogs.showSettingsModal),
              // SizedBox(
              //   height: 80,
              //   width: 200,
              //   child: Sprite.load(Assets.images.keyboardTip.keyName)
              //       .asWidget(), // 'keyboard_tip.png'
              // ),
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
                      text: t.menuPage.poweredByPrefix,
                    ),
                    TextSpan(
                      text: t.menuPage.author,
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          _launchUrlString('https://github.com/kjxbyz');
                        },
                      style: const TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.blue,
                      ),
                    ),
                    TextSpan(
                      text: t.menuPage.poweredBySuffix,
                    ),
                  ],
                ),
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'Normal',
                  fontSize: 12,
                ),
              ),
              FutureBuilder<PackageInfo>(
                future: initAppInfo(),
                builder: (context, AsyncSnapshot<PackageInfo> snapshot) {
                  if (snapshot.hasData) {
                    final version = snapshot.data!.version;
                    final buildNumber = snapshot.data!.buildNumber;
                    final fullVersion = '$version+$buildNumber';
                    return Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: t.menuPage.version(version: version),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                _launchUrlString(
                                  'https://github.com/fafarunner/fafarunner/releases/tag/v$fullVersion',
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
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSplash() {
    final t = Translations.of(context);
    return Title(
      title: t.appName,
      color: Colors.black,
      child: FlameSplashScreen(
        theme: FlameSplashTheme(
          backgroundDecoration: const BoxDecoration(color: Colors.black),
          logoBuilder: (context) => LayoutBuilder(
            builder: (context, constraints) {
              return Assets.logo.image(width: 300, height: 300);
            },
          ),
        ),
        onFinish: (BuildContext context) {
          setState(() => showSplash = false);
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

  Future<void> _launchUrlString(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> registerHotkeys() async {
    final hotKey = HotKey(
      key: LogicalKeyboardKey.keyA,
      scope: HotKeyScope.inapp,
    );

    await hotKeyManager.register(
      hotKey,
      keyDownHandler: _keyDownHandler,
      keyUpHandler: _keyUpHandler,
    );
  }

  void _keyDownHandler(HotKey hotKey) {
    printDebugLog('keyDownHandler');
  }

  void _keyUpHandler(HotKey hotKey) {
    printDebugLog('keyUpHandler');
  }

  Future<void> initTrayMenu() async {
    final t = Translations.of(context);
    await tray.trayManager.setIcon(
      Platform.isWindows ? Assets.trayIcon : Assets.trayLogo.keyName,
    );
    final menu = tray.Menu(
      items: [
        tray.MenuItem(
          key: Menus.settings.name,
          label: t.tray.settings,
        ),
        tray.MenuItem.separator(),
        tray.MenuItem(
          key: Menus.exit.name,
          label: t.tray.exit,
        ),
      ],
    );
    await tray.trayManager.setContextMenu(menu);
  }

  @override
  void onTrayIconMouseDown() {
    tray.trayManager.popUpContextMenu();
  }

  @override
  void onTrayMenuItemClick(tray.MenuItem menuItem) {
    if (menuItem.key == Menus.settings.name) {
      Dialogs.showSettingsModal();
    } else if (menuItem.key == Menus.exit.name) {
      exit(0);
    }
  }
}

class KeyTips extends StatelessWidget {
  const KeyTips({required this.onKeySelected, super.key});

  final VoidCallback onKeySelected;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final controller = Get.find<SettingsController>();
    return SizedBox(
      height: 60,
      child: FittedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          spacing: 26,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              spacing: 4,
              children: [
                HotKeyVirtualView(
                  hotKey: HotKey(key: LogicalKeyboardKey.arrowUp),
                ),
                Row(
                  children: [
                    HotKeyVirtualView(
                      hotKey: HotKey(key: LogicalKeyboardKey.arrowLeft),
                    ),
                    HotKeyVirtualView(
                      hotKey: HotKey(key: LogicalKeyboardKey.arrowDown),
                    ),
                    HotKeyVirtualView(
                      hotKey: HotKey(key: LogicalKeyboardKey.arrowRight),
                    ),
                  ],
                ),
                Text(
                  t.settings.shortcuts.move,
                  style: const TextStyle(fontFamily: 'Normal'),
                ),
              ],
            ),
            Obx(() {
              final attackKey = controller.attackKey.value;

              return TextButton(
                onPressed: onKeySelected,
                style: ButtonStyle(
                  padding: WidgetStateProperty.all(EdgeInsets.zero),
                  visualDensity: const VisualDensity(
                    horizontal: VisualDensity.minimumDensity,
                    vertical: VisualDensity.minimumDensity,
                  ),
                  foregroundColor: WidgetStateProperty.all(FRColors.white),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 4,
                  children: [
                    HotKeyVirtualView(hotKey: attackKey),
                    Text(
                      t.settings.shortcuts.attack,
                      style: const TextStyle(fontFamily: 'Normal'),
                    ),
                  ],
                ),
              );
            }),
            Obx(() {
              final fireKey = controller.fireKey.value;

              return TextButton(
                onPressed: onKeySelected,
                style: ButtonStyle(
                  padding: WidgetStateProperty.all(EdgeInsets.zero),
                  visualDensity: const VisualDensity(
                    horizontal: VisualDensity.minimumDensity,
                    vertical: VisualDensity.minimumDensity,
                  ),
                  foregroundColor: WidgetStateProperty.all(FRColors.white),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 4,
                  children: [
                    HotKeyVirtualView(hotKey: fireKey),
                    Text(
                      t.settings.shortcuts.fire,
                      style: const TextStyle(fontFamily: 'Normal'),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
