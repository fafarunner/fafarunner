import 'package:flutter/foundation.dart';

/// Check whether the current environment is a browser environment.
bool get isWeb {
  return kIsWeb || kIsWasm;
}

/// Check whether the current environment is a desktop environment.
bool get isDesktop {
  if (isWeb) return false;
  return [
    TargetPlatform.windows,
    TargetPlatform.linux,
    TargetPlatform.macOS,
  ].contains(defaultTargetPlatform);
}

/// Check whether the current environment is a mobile environment.
bool get isMobile {
  if (isWeb) return false;
  return [
    TargetPlatform.iOS,
    TargetPlatform.android,
  ].contains(defaultTargetPlatform);
}

/// Check whether the current environment is an iOS environment.
bool get isIOS {
  if (isWeb) return false;
  return [TargetPlatform.iOS].contains(defaultTargetPlatform);
}

/// Check whether the current environment is an Android environment.
bool get isAndroid {
  if (isWeb) return false;
  return [TargetPlatform.android].contains(defaultTargetPlatform);
}

/// Check whether the current environment is a Linux environment.
bool get isLinux {
  if (isWeb) return false;
  return [TargetPlatform.linux].contains(defaultTargetPlatform);
}

/// Check whether the current environment is a macOS environment.
bool get isMacOS {
  if (isWeb) return false;
  return [TargetPlatform.macOS].contains(defaultTargetPlatform);
}

/// Check whether the current environment is a Windows environment.
bool get isWindows {
  if (isWeb) return false;
  return [TargetPlatform.windows].contains(defaultTargetPlatform);
}

/// Checks if the current environment is a mobile environment.
bool get isSplashSupported {
  if (isWeb) return true;
  return [
    TargetPlatform.iOS,
    TargetPlatform.android,
  ].contains(defaultTargetPlatform);
}
