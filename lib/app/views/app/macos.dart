import 'package:fafa_runner/l10n/l10n.dart';
import 'package:fafa_runner/menu/menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class MacosAppView extends StatelessWidget {
  const MacosAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MacosApp(
      debugShowCheckedModeBanner: false,
      theme: MacosThemeData.light(),
      darkTheme: MacosThemeData.dark(),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      navigatorObservers: [
        SentryNavigatorObserver(),
      ],
      home: const Menu(),
    );
  }
}
