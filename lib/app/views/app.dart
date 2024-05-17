import 'package:fafarunner/config/navigator.dart';
import 'package:fafarunner/constrants/env.dart';
import 'package:fafarunner/i18n/i18n.dart';
import 'package:fafarunner/menu/menu.dart';
import 'package:fafarunner/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

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
