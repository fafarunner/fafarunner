// Flutter imports:
import 'package:flutter/material.dart';

class DefectorRadio<T> extends StatelessWidget {
  const DefectorRadio({
    required this.value,
    this.group,
    this.label,
    this.onChange,
    super.key,
  });

  final T value;
  final T? group;
  final String? label;
  final ValueChanged<T>? onChange;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChange?.call(value);
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 2),
            ),
            child: Container(
              width: 8,
              height: 8,
              margin: const EdgeInsets.all(2),
              color: value == group ? Colors.white : Colors.transparent,
            ),
          ),
          if (label != null) ...[
            const SizedBox(
              width: 10,
            ),
            Text(
              label!,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ],
      ),
    );
  }
}
