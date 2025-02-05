// Flutter imports:
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:bonfire/bonfire.dart' hide BarLifeComponent;

// Project imports:
import '../interface/bar_life_component.dart';
import '../player/knight.dart';
import '../../gen/assets.gen.dart';

class KnightInterface extends GameInterface {
  late Sprite sprite;

  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load(Assets.images.items.keySilver.keyName); // 'items/key_silver.png'
    add(BarLifeComponent());
    return super.onLoad();
  }

  @override
  void render(Canvas canvas) {
    try {
      _drawKey(canvas);
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    super.render(canvas);
  }

  void _drawKey(Canvas c) {
    if (gameRef.player != null && (gameRef.player! as Knight).containKey) {
      sprite.renderRect(c, const Rect.fromLTWH(150, 20, 35, 30));
    }
  }
}
