import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:game/src/extensions/keyboard_key.dart';

import 'hotkey_virtual_view.dart';

class HotKeyRecorder extends StatefulWidget {
  const HotKeyRecorder({
    required this.onHotKeyRecorded,
    this.initialHotKey,
    super.key,
  });

  final LogicalKeyboardKey? initialHotKey;
  final ValueChanged<LogicalKeyboardKey> onHotKeyRecorded;

  @override
  State<HotKeyRecorder> createState() => _HotKeyRecorderState();
}

class _HotKeyRecorderState extends State<HotKeyRecorder> {
  LogicalKeyboardKey? _hotKey;

  @override
  void initState() {
    if (widget.initialHotKey != null) {
      _hotKey = widget.initialHotKey;
    }
    HardwareKeyboard.instance.addHandler(_handleKeyEvent);
    super.initState();
  }

  @override
  void dispose() {
    HardwareKeyboard.instance.removeHandler(_handleKeyEvent);
    super.dispose();
  }

  bool _handleKeyEvent(KeyEvent keyEvent) {
    if (keyEvent is KeyUpEvent) return false;
    final key = keyEvent.physicalKey;
    _hotKey = key.logicalKey;
    widget.onHotKeyRecorded(_hotKey!);
    setState(() {});
    return true;
  }

  @override
  Widget build(BuildContext context) {
    if (_hotKey == null) {
      return Container();
    }
    return HotKeyVirtualView(hotKey: _hotKey!);
  }
}
