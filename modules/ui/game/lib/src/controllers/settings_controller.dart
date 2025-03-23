// Flutter imports:
import 'dart:convert';

import 'package:flutter/material.dart';

// Package imports:
import 'package:app/app.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hotkey_manager/hotkey_manager.dart';
import 'package:logger/logger.dart';

import '../enums/enums.dart';
import '../util/string_util.dart';

const cachedKeyPrefix = 'fr_hotkey_';

String getCachedKey(String key) {
  return '$cachedKeyPrefix$key';
}

class SettingsController extends GetxController {
  final box = GetStorage(AppConfig.shared.container);

  Rx<ThemeMode> themeMode = ThemeMode.system.obs;
  Rx<HotKey> attackKey = HotKey(
    key: LogicalKeyboardKey.space,
    scope: HotKeyScope.inapp,
  ).obs;
  Rx<HotKey> fireKey = HotKey(
    key: LogicalKeyboardKey.keyZ,
    scope: HotKeyScope.inapp,
  ).obs;

  // Read stored data at initialization
  @override
  void onInit() {
    super.onInit();
    // Read stored data, set default value if not
    final themeModeFromStorage = getThemeMode();
    themeMode.value = themeModeFromStorage;

    final attackHotKey = getAttackHotKey();
    if (attackHotKey != null) {
      attackKey.value = attackHotKey;
    }

    final fireHotKey = getFireHotKey();
    if (fireHotKey != null) {
      fireKey.value = fireHotKey;
    }
  }

  void switchThemeMode(ThemeMode themeMode) {
    this.themeMode.value = themeMode;
    box.write('themeMode', themeMode.name);
  }

  void setAttackHotkey(HotKey hotkey) {
    attackKey.value = hotkey;
    box.write(getCachedKey(CustomKeys.attack.name), jsonEncode(hotkey.toJson()));
  }

  void setFireHotkey(HotKey hotkey) {
    fireKey.value = hotkey;
    box.write(getCachedKey(CustomKeys.fire.name), jsonEncode(hotkey.toJson()));
  }

  ThemeMode getThemeMode() {
    final name = box.read<String?>('themeMode');
    printDebugLog('theme mode from storage: $name');
    if (StringUtil.isBlank(name)) return ThemeMode.system;
    return ThemeMode.values.asNameMap().containsKey(name)
        ? ThemeMode.values.byName(name!)
        : ThemeMode.system;
  }

  HotKey? getAttackHotKey() {
    final value = box.read<String?>(getCachedKey(CustomKeys.attack.name));
    printDebugLog('${CustomKeys.attack} from storage: $value');
    if (StringUtil.isNotBlank(value)) {
      try {
        final keyJson = jsonDecode(value!);
        if (keyJson != null && keyJson is Map) {
          return HotKey.fromJson(keyJson as Map<String, dynamic>);
        }
      } on Exception catch (error) {
       printErrorLog(error);
      }
    }
    return null;
  }

  HotKey? getFireHotKey() {
    final value = box.read<String?>(getCachedKey(CustomKeys.fire.name));
    printDebugLog('${CustomKeys.fire} from storage: $value');
    if (StringUtil.isNotBlank(value)) {
      try {
        final keyJson = jsonDecode(value!);
        if (keyJson != null && keyJson is Map) {
          return HotKey.fromJson(keyJson as Map<String, dynamic>);
        }
      } on Exception catch (error) {
        printErrorLog(error);
      }
    }
    return null;
  }


}
