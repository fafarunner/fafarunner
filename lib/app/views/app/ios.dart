import 'package:fafarunner/config/navigator.dart';
import 'package:fafarunner/constrants/env.dart';
import 'package:fafarunner/i18n/i18n.dart';
import 'package:fafarunner/menu/menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class IOSAppView extends StatelessWidget {
  const IOSAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
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
