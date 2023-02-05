import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/l10n/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:trending_repository/trending_repository.dart';

class MockTrendingRepository extends Mock implements TrendingRepository {}

extension PumpApp on WidgetTester {
  Future<void> pumpApp(
    Widget widget, {
    TrendingRepository? trendingRepository,
  }) {
    return pumpWidget(RepositoryProvider.value(
      value: trendingRepository ?? MockTrendingRepository(),
      child: MaterialApp(
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(body: widget),
      ),
    ));
  }

  Future<void> pumpRoute(
    Route<dynamic> route, {
    TrendingRepository? trendingRepository,
  }) {
    return pumpApp(
      Navigator(onGenerateRoute: (_) => route),
      trendingRepository: trendingRepository,
    );
  }
}
