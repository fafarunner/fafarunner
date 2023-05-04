import 'package:fafa_runner/l10n/l10n.dart';
import 'package:fafa_runner/menu/menu.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class WindowsAppView extends StatelessWidget {
  const WindowsAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return FluentApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      navigatorObservers: [
        SentryNavigatorObserver(),
      ],
      home: const Menu(),
    );
  }
}
