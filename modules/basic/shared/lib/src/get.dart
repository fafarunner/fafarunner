// Flutter imports:
import 'package:flutter/foundation.dart';

/// Checks if the current environment is a desktop environment.
bool get isDesktop {
  if (kIsWeb) return false;
  return [
    TargetPlatform.windows,
    TargetPlatform.linux,
    TargetPlatform.macOS,
  ].contains(defaultTargetPlatform);
}

/// Checks if the current environment is a mobile environment.
bool get isMobile {
  if (kIsWeb) return false;
  return [
    TargetPlatform.iOS,
    TargetPlatform.android,
  ].contains(defaultTargetPlatform);
}

///
bool get isIOS {
  if (kIsWeb) return false;
  return [
    TargetPlatform.iOS,
  ].contains(defaultTargetPlatform);
}

///
bool get isAndroid {
  if (kIsWeb) return false;
  return [
    TargetPlatform.android,
  ].contains(defaultTargetPlatform);
}

///
bool get isLinux {
  if (kIsWeb) return false;
  return [
    TargetPlatform.linux,
  ].contains(defaultTargetPlatform);
}

///
bool get isMacOS {
  if (kIsWeb) return false;
  return [
    TargetPlatform.macOS,
  ].contains(defaultTargetPlatform);
}

///
bool get isWindows {
  if (kIsWeb) return false;
  return [
    TargetPlatform.windows,
  ].contains(defaultTargetPlatform);
}

/// Checks if the current environment is a mobile environment.
bool get isSplashSupported {
  if (kIsWeb) return true;
  return [
    TargetPlatform.iOS,
    TargetPlatform.android,
  ].contains(defaultTargetPlatform);
}
