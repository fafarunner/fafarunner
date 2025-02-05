// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:game/game.dart';
import 'package:l10n/l10n.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:theme/theme.dart';

// Project imports:
import 'package:fafarunner/config/navigator.dart';
import 'package:fafarunner/constrants/env.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      navigatorKey: AppNavigator.key,
      locale: TranslationProvider.of(context).flutterLocale,
      supportedLocales: AppLocaleUtils.supportedLocales,
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      navigatorObservers: [
        if (AppEnv.sentryEnabled) SentryNavigatorObserver(),
      ],
      home: const Menu(),
    );
  }
}
