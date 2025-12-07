import 'dart:math';

import 'package:flutter/material.dart';

import 'package:app/app.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
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
  Rx<int> directionalKeys = 0.obs;
  Rx<LogicalKeyboardKey> attackKey = LogicalKeyboardKey.space.obs;
  Rx<LogicalKeyboardKey> fireKey = LogicalKeyboardKey.keyZ.obs;

  // Read stored data at initialization
  @override
  void onInit() {
    super.onInit();
    // Read stored data, set default value if not
    final themeModeFromStorage = getThemeMode();
    themeMode.value = themeModeFromStorage;

    directionalKeys.value = getDirectionalKeys();

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

  void setDirectionalKeys(int index) {
    directionalKeys.value = index;
    box.write(
      getCachedKey(CustomKeys.directional.name),
      index,
    );
  }

  void setAttackHotkey(LogicalKeyboardKey hotkey) {
    attackKey.value = hotkey;
    box.write(
      getCachedKey(CustomKeys.attack.name),
      hotkey.keyId,
    );
  }

  void setFireHotkey(LogicalKeyboardKey hotkey) {
    fireKey.value = hotkey;
    box.write(
      getCachedKey(CustomKeys.fire.name),
      hotkey.keyId,
    );
  }

  ThemeMode getThemeMode() {
    final name = box.read<String?>('themeMode');
    printDebugLog('theme mode from storage: $name');

    if (StringUtil.isBlank(name)) return ThemeMode.system;

    return ThemeMode.values.asNameMap().containsKey(name)
        ? ThemeMode.values.byName(name!)
        : ThemeMode.system;
  }

  int getDirectionalKeys() {
    final value = box.read<dynamic>(getCachedKey(CustomKeys.directional.name));
    printDebugLog('directional from storage: $value');

    if (value != null) {
      if (value is int) {
        return min(1, value);
      } else if (value is String) {
        final idx = int.tryParse(value);
        if (idx != null) {
          return min(1, idx);
        } else {
          printErrorLog('[${CustomKeys.directional}]: Invalid value: $value');
        }
      }
    }

    return 0;
  }

  LogicalKeyboardKey? getAttackHotKey() {
    final value = box.read<dynamic>(getCachedKey(CustomKeys.attack.name));
    printDebugLog('${CustomKeys.attack} from storage: $value');

    if (value != null) {
      if (value is int) {
        return LogicalKeyboardKey(value);
      } else if (value is String) {
        final keyId = int.tryParse(value);
        if (keyId != null) {
          return LogicalKeyboardKey(keyId);
        } else {
          printErrorLog('[${CustomKeys.attack}]: Invalid value: $value');
        }
      }
    }

    return null;
  }

  LogicalKeyboardKey? getFireHotKey() {
    final value = box.read<dynamic>(getCachedKey(CustomKeys.fire.name));
    printDebugLog('${CustomKeys.fire} from storage: $value');

    if (value != null) {
      if (value is int) {
        return LogicalKeyboardKey(value);
      } else if (value is String) {
        final keyId = int.tryParse(value);
        if (keyId != null) {
          return LogicalKeyboardKey(keyId);
        } else {
          printErrorLog('[${CustomKeys.fire}]: Invalid value: $value');
        }
      }
    }

    return null;
  }
}
