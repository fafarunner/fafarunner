import 'package:flutter/foundation.dart';

/// Check whether the current environment is a browser environment.
bool get isWeb => kIsWeb || kIsWasm;

/// Check whether the current environment is an iOS environment.
bool get isIOS => !isWeb && TargetPlatform.iOS == defaultTargetPlatform;

/// Check whether the current environment is an Android environment.
bool get isAndroid => !isWeb && TargetPlatform.android == defaultTargetPlatform;

/// Check whether the current environment is an Fuchsia environment.
bool get isFuchsia => !isWeb && TargetPlatform.fuchsia == defaultTargetPlatform;

/// Check whether the current environment is a Linux environment.
bool get isLinux => !isWeb && TargetPlatform.linux == defaultTargetPlatform;

/// Check whether the current environment is a macOS environment.
bool get isMacOS => !isWeb && TargetPlatform.macOS == defaultTargetPlatform;

/// Check whether the current environment is a Windows environment.
bool get isWindows => !isWeb && TargetPlatform.windows == defaultTargetPlatform;

/// return true if running on iOS or macOS
bool get isApple => !isWeb && (isIOS || isMacOS);

/// return true if running on Android of Fuchsia
bool get isGoogle => !isWeb && (isAndroid || isFuchsia);

/// Check whether the current environment is a desktop environment.
bool get isDesktop => !isWeb && (isMacOS || isWindows || isLinux);

/// Check whether the current environment is a mobile environment.
bool get isMobile => !isWeb && (isAndroid || isIOS);

/// Checks if the current environment is a mobile environment.
bool get isSplashSupported => isWeb || isMobile;
