import 'package:fafa_runner/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

extension PumpApp on WidgetTester {
  Future<void> pumpApp(
    Widget widget,
  ) {
    return pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
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
