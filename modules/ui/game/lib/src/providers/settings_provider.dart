import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:nb_utils/nb_utils.dart';

import '../enums/enums.dart';
import '../util/string_util.dart';

const cachedKeyPrefix = 'fr_hotkey_';

String getCachedKey(String key) {
  return '$cachedKeyPrefix$key';
}

class SettingsProvider extends ChangeNotifier {
  SettingsProvider() {
    themeMode = getThemeMode();

    directionalKeys = getDirectionalKeys();

    final attackHotKey = getAttackHotKey();
    if (attackHotKey != null) {
      attackKey = attackHotKey;
    }

    final fireHotKey = getFireHotKey();
    if (fireHotKey != null) {
      fireKey = fireHotKey;
    }

    notifyListeners();
  }

  // 主题
  ThemeMode themeMode = ThemeMode.system;

  int directionalKeys = 0;

  LogicalKeyboardKey attackKey = LogicalKeyboardKey.space;

  LogicalKeyboardKey fireKey = LogicalKeyboardKey.keyZ;

  void switchThemeMode(ThemeMode themeMode) {
    this.themeMode = themeMode;
    notifyListeners();
    setValue('themeMode', themeMode.name);
  }

  void setDirectionalKeys(int index) {
    directionalKeys = index;
    notifyListeners();
    setValue(getCachedKey(CustomKeys.directional.name), index);
  }

  void setAttackHotkey(LogicalKeyboardKey hotkey) {
    attackKey = hotkey;
    notifyListeners();
    setValue(getCachedKey(CustomKeys.attack.name), hotkey.keyId);
  }

  void setFireHotkey(LogicalKeyboardKey hotkey) {
    fireKey = hotkey;
    notifyListeners();
    setValue(getCachedKey(CustomKeys.fire.name), hotkey.keyId);
  }

  ThemeMode getThemeMode() {
    final name = getStringAsync('themeMode');
    printDebugLog('theme mode from storage: $name');

    if (StringUtil.isBlank(name)) return ThemeMode.system;

    return ThemeMode.values.asNameMap().containsKey(name)
        ? ThemeMode.values.byName(name)
        : ThemeMode.system;
  }

  int getDirectionalKeys() {
    final value = getIntAsync(getCachedKey(CustomKeys.directional.name));
    printDebugLog('directional from storage: $value');

    return min(1, value);
  }

  LogicalKeyboardKey? getAttackHotKey() {
    final value = getIntAsync(getCachedKey(CustomKeys.attack.name));
    printDebugLog('${CustomKeys.attack} from storage: $value');

    return value != 0 ? LogicalKeyboardKey(value) : null;
  }

  LogicalKeyboardKey? getFireHotKey() {
    final value = getIntAsync(getCachedKey(CustomKeys.fire.name));
    printDebugLog('${CustomKeys.fire} from storage: $value');

    return value != 0 ? LogicalKeyboardKey(value) : null;
  }
}
