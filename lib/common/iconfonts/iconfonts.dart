
import 'package:flutter/widgets.dart';

class FTIconData extends IconData {
  const FTIconData(super.codePoint, { super.matchTextDirection = false })
      : super(
    fontFamily: 'iconfont'
  );
}

class IconFonts {
  static const IconData push = FTIconData(0xe657);
  static const IconData branch = FTIconData(0xe648);
  static const IconData fork = FTIconData(0xe64a);
  static const IconData issue = FTIconData(0xe64d);
  static const IconData code = FTIconData(0xe646);
  static const IconData star = FTIconData(0xe644);
  static const IconData book = FTIconData(0xe643);
  static const IconData search = FTIconData(0xe63f);
  static const IconData lock = FTIconData(0xe63e);
  static const IconData repo = FTIconData(0xe63d);
  static const IconData pull = FTIconData(0xe63b);
  static const IconData github = FTIconData(0xe638);
  static const IconData tag = FTIconData(0xe671);
  static const IconData organization = FTIconData(0xe673);
  static const IconData location = FTIconData(0xe66c);
  static const IconData info = FTIconData(0xe656);
  static const IconData link = FTIconData(0xe655);
  static const IconData mail = FTIconData(0xe66e);
  static const IconData person = FTIconData(0xe65c);
}
