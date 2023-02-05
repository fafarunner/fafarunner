import 'package:flutter/material.dart';

///
class NavigatorUtil {
  static void push(
    BuildContext context,
    Widget widget, {
    RouteSettings? settings,
  }) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (BuildContext context) => widget, settings: settings),
    );
  }

  static void pop(BuildContext context) {
    Navigator.pop(context);
  }
}
