// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:app/app.dart';

bool _defaultRoutePredicate(Route<dynamic> route) => false;

///
class NavigatorUtil {
  static void push<T extends Object?>(
    Widget widget, {
    RouteSettings? settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
    String? barrierLabel,
  }) {
    Navigator.push<T>(
      AppNavigator.navigatorKey.currentContext!,
      MaterialPageRoute<T>(
        builder: (BuildContext context) => widget,
        settings: settings,
        maintainState: maintainState,
        fullscreenDialog: fullscreenDialog,
      ),
    );
  }

  static void pushAndRemoveUntil<T extends Object?>(
    Widget widget, {
    RoutePredicate predicate = _defaultRoutePredicate,
    RouteSettings? settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
    String? barrierLabel,
  }) {
    Navigator.pushAndRemoveUntil<T>(
      AppNavigator.navigatorKey.currentContext!,
      MaterialPageRoute<T>(
        builder: (BuildContext context) => widget,
        settings: settings,
        maintainState: maintainState,
        fullscreenDialog: fullscreenDialog,
      ),
      predicate,
    );
  }

  static void pushReplacement<T extends Object?, TO extends Object?>(
    Widget widget, {
    RouteSettings? settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
    String? barrierLabel,
  }) {
    Navigator.pushReplacement<T, TO>(
      AppNavigator.navigatorKey.currentContext!,
      MaterialPageRoute<T>(
        builder: (BuildContext context) => widget,
        settings: settings,
        maintainState: maintainState,
        fullscreenDialog: fullscreenDialog,
      ),
    );
  }

  static void pop() {
    Navigator.pop(AppNavigator.navigatorKey.currentContext!);
  }
}
