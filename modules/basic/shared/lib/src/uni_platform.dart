import 'dart:io';

import 'package:flutter/foundation.dart';

///
class UniPlatform {
  static String? _operatingSystem;

  ///
  static String get operatingSystem {
    if (!kIsWeb) {
      _operatingSystem ??= Platform.operatingSystem;
    }
    return _operatingSystem ?? 'unknown';
  }

  @visibleForTesting
  static set operatingSystem(String value) {
    _operatingSystem = value;
  }

  /// Whether the platform is Android.
  static bool get isAndroid => operatingSystem == 'android';

  /// Whether the platform is Fuchsia.
  static bool get isFuchsia => operatingSystem == 'fuchsia';

  /// Whether the platform is iOS.
  static bool get isIOS => operatingSystem == 'ios';

  /// Whether the platform is Linux.
  static bool get isLinux => operatingSystem == 'linux';

  /// Whether the platform is macOS.
  static bool get isMacOS => operatingSystem == 'macos';

  /// Whether the platform is Web.
  static bool get isWeb => kIsWeb;

  /// Whether the platform is Windows.
  static bool get isWindows => operatingSystem == 'windows';

  /// Selects a value with the specified platform.
  ///
  /// If the platform is not specified, the [otherwise] value is returned.
  ///
  /// Example:
  /// ```dart
  /// import 'package:uni_platform/uni_platform.dart';
  ///
  /// String platformType = UniPlatform.select<String>(
  ///   android: 'Android',
  ///   fuchsia: 'Fuchsia',
  ///   iOS: 'iOS',
  ///   linux: 'Linux',
  ///   macOS: 'macOS',
  ///   windows: 'Windows',
  ///   web: 'Web',
  ///   otherwise: 'Unknown',
  /// );
  /// ```
  static T select<T>({
    // Specified based on platform type
    T? android,
    T? fuchsia,
    T? ios,
    T? linux,
    T? macos,
    T? windows,
    T? web,
    // Specified based on device type
    T? desktop,
    T? mobile,
    // Unspecified platform
    T? otherwise,
  }) {
    final isDesktop = isLinux || isMacOS || isWindows;
    final isMobile = isAndroid || isIOS;
    if (isAndroid && android != null) {
      return android;
    } else if (isFuchsia && fuchsia != null) {
      return fuchsia;
    } else if (isIOS && ios != null) {
      return ios;
    } else if (isLinux && linux != null) {
      return linux;
    } else if (isMacOS && macos != null) {
      return macos;
    } else if (isWindows && windows != null) {
      return windows;
    } else if (isWeb && web != null) {
      return web;
    } else if (isDesktop && desktop != null) {
      return desktop;
    } else if (isMobile && mobile != null) {
      return mobile;
    } else if (otherwise != null) {
      return otherwise;
    }
    throw Exception('No platform selected');
  }

  /// Calls the specified function with the specified platform.
  ///
  /// If the platform is not specified, the [otherwise] function is called.
  ///
  /// Example:
  /// ```dart
  /// String platformType = UniPlatform.call<String>(
  ///   android: () => 'Android',
  ///   fuchsia: () => 'Fuchsia',
  ///   iOS: () => 'iOS',
  ///   linux: () => 'Linux',
  ///   macOS: () => 'macOS',
  ///   windows: () => 'Windows',
  ///   web: () => 'Web',
  ///   otherwise: () => 'Unknown',
  /// );
  /// ```
  static T call<T>({
    T Function()? android,
    T Function()? fuchsia,
    T Function()? ios,
    T Function()? linux,
    T Function()? macos,
    T Function()? windows,
    T Function()? web,
    T Function()? desktop,
    T Function()? mobile,
    T Function()? otherwise,
  }) {
    return select<ValueGetter<T>>(
      android: android,
      fuchsia: fuchsia,
      ios: ios,
      linux: linux,
      macos: macos,
      windows: windows,
      web: web,
      desktop: desktop,
      mobile: mobile,
      otherwise: otherwise,
    )();
  }
}
