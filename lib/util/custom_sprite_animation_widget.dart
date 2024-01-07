import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';

class CustomSpriteAnimationWidget extends StatelessWidget {
  const CustomSpriteAnimationWidget({required this.animation, super.key});

  final Future<SpriteAnimation> animation;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 100,
      child: animation.asWidget(),
    );
  }
}
