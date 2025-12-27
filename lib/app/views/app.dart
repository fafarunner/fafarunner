import 'package:flutter/material.dart';

import 'package:app/app.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:game/game.dart';
import 'package:l10n/l10n.dart';
import 'package:provider/provider.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:theme/theme.dart';

import 'package:fafarunner/constrants/env.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final themeMode = context.select<SettingsProvider, ThemeMode>(
      (provider) => provider.themeMode,
    );
    final child = DefaultTextStyle.merge(
      style: const TextStyle(
        fontFamily: 'NotoSansSC',
        fontWeight: FontWeight.normal,
      ),
      child: const SelectionArea(child: Menu()),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: themeMode,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      navigatorKey: AppNavigator.navigatorKey,
      locale: TranslationProvider.of(context).flutterLocale,
      supportedLocales: AppLocaleUtils.supportedLocales,
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      navigatorObservers: [
        BotToastNavigatorObserver(),
        if (AppEnv.sentryEnabled) SentryNavigatorObserver(),
      ],
      builder: BotToastInit(),
      home: child,
    );
  }
}
