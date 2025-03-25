import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../extensions/keyboard_key.dart';

class _VirtualKeyView extends StatelessWidget {
  const _VirtualKeyView({
    required this.keyLabel,
    this.labelColor,
  });

  final String keyLabel;
  final Color? labelColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 5, right: 5, top: 3, bottom: 3),
      decoration: BoxDecoration(
        color: Theme.of(context).canvasColor,
        border: Border.all(
          color: labelColor ?? Theme.of(context).dividerColor,
        ),
        borderRadius: BorderRadius.circular(3),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Text(
        keyLabel,
        style: TextStyle(
          color: labelColor ?? Theme.of(context).textTheme.bodyMedium?.color,
          fontSize: 12,
        ),
      ),
    );
  }
}

class HotKeyVirtualView extends StatelessWidget {
  const HotKeyVirtualView({
    required this.hotKey,
    this.labelColor,
    super.key,
  });

  final LogicalKeyboardKey hotKey;
  final Color? labelColor;

  @override
  Widget build(BuildContext context) {
    return _VirtualKeyView(
      keyLabel: hotKey.label,
      labelColor: labelColor,
    );
  }
}
