import 'package:fafarunner/l10n/l10n.dart';
import 'package:fafarunner/menu/menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class IOSAppView extends StatelessWidget {
  const IOSAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      navigatorObservers: [
        SentryNavigatorObserver(),
      ],
      home: const Menu(),
    );
  }
}
