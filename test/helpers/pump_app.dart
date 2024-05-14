import 'package:fafarunner/i18n/i18n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';

extension PumpApp on WidgetTester {
  Future<void> pumpApp(
    Widget widget,
  ) {
    return pumpWidget(
      MaterialApp(
        locale: AppLocaleUtils.findDeviceLocale().flutterLocale,
        supportedLocales: AppLocaleUtils.supportedLocales,
        localizationsDelegates: GlobalMaterialLocalizations.delegates,
        home: Scaffold(body: widget),
      ),
    );
  }

  Future<void> pumpRoute(
    Route<dynamic> route,
  ) {
    return pumpApp(
      Navigator(onGenerateRoute: (_) => route),
    );
  }
}
