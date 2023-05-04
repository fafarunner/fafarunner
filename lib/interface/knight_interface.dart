import 'dart:ui';

import 'package:bonfire/bonfire.dart' hide BarLifeComponent;
import 'package:fafa_runner/interface/bar_life_component.dart';
import 'package:fafa_runner/player/knight.dart';
import 'package:flutter/material.dart';

class KnightInterface extends GameInterface {
  late Sprite key;

  @override
  Future<void> onLoad() async {
    key = await Sprite.load('items/key_silver.png');
    add(BarLifeComponent());
    return super.onLoad();
  }

  @override
  void render(Canvas canvas) {
    try {
      _drawKey(canvas);
    } catch (e) {}
    super.render(canvas);
  }

  void _drawKey(Canvas c) {
    if (gameRef.player != null && (gameRef.player as Knight).containKey) {
      key.renderRect(c, const Rect.fromLTWH(150, 20, 35, 30));
    }
  }
}
