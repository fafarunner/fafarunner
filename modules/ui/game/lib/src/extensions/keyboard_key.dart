import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'package:shared/shared.dart';

/// Map of logical key id to physical key id.
Map<int, int> _keymap = {
  0x00000000020: 0x0007002c, // Space
  0x00000000022: 0x00070034, // Quote
  0x0000000002c: 0x00070036, // Comma
  0x0000000002d: 0x0007002d, // Minus
  0x0000000002e: 0x00070037, // Period
  0x0000000002f: 0x00070038, // Slash
  0x00000000030: 0x00070027, // Digit 0
  0x00000000031: 0x0007001e, // Digit 1
  0x00000000032: 0x0007001f, // Digit 2
  0x00000000033: 0x00070020, // Digit 3
  0x00000000034: 0x00070021, // Digit 4
  0x00000000035: 0x00070022, // Digit 5
  0x00000000036: 0x00070023, // Digit 6
  0x00000000037: 0x00070024, // Digit 7
  0x00000000038: 0x00070025, // Digit 8
  0x00000000039: 0x00070026, // Digit 9
  0x0000000003b: 0x00070033, // Semicolon
  0x0000000003d: 0x0007002e, // Equal
  0x0000000005b: 0x0007002f, // Bracket Left
  0x0000000005c: 0x00070031, // Backslash
  0x0000000005d: 0x00070030, // Bracket Right
  0x00000000060: 0x00070035, // Backquote
  0x00000000061: 0x00070004, // Key A
  0x00000000062: 0x00070005, // Key B
  0x00000000063: 0x00070006, // Key C
  0x00000000064: 0x00070007, // Key D
  0x00000000065: 0x00070008, // Key E
  0x00000000066: 0x00070009, // Key F
  0x00000000067: 0x0007000a, // Key G
  0x00000000068: 0x0007000b, // Key H
  0x00000000069: 0x0007000c, // Key I
  0x0000000006a: 0x0007000d, // Key J
  0x0000000006b: 0x0007000e, // Key K
  0x0000000006c: 0x0007000f, // Key L
  0x0000000006d: 0x00070010, // Key M
  0x0000000006e: 0x00070011, // Key N
  0x0000000006f: 0x00070012, // Key O
  0x00000000070: 0x00070013, // Key P
  0x00000000071: 0x00070014, // Key Q
  0x00000000072: 0x00070015, // Key R
  0x00000000073: 0x00070016, // Key S
  0x00000000074: 0x00070017, // Key T
  0x00000000075: 0x00070018, // Key U
  0x00000000076: 0x00070019, // Key V
  0x00000000077: 0x0007001a, // Key W
  0x00000000078: 0x0007001b, // Key X
  0x00000000079: 0x0007001c, // Key Y
  0x0000000007a: 0x0007001d, // Key Z
  0x00100000008: 0x0007002a, // Backspace
  0x00100000009: 0x0007002b, // Tab
  0x0010000000d: 0x00070028, // Enter
  0x0010000001b: 0x00070029, // Escape
  0x0010000007f: 0x0007004c, // Delete
  0x00100000104: 0x00070039, // Caps Lock
  0x00100000106: 0x00000012, // Fn
  0x00100000107: 0x00000013, // Fn Lock
  0x00100000108: 0x00000010, // Hyper
  0x0010000010a: 0x00070053, // Num Lock
  0x0010000010c: 0x00070047, // Scroll Lock
  0x00100000301: 0x00070051, // Arrow Down
  0x00100000302: 0x00070050, // Arrow Left
  0x00100000303: 0x0007004f, // Arrow Right
  0x00100000304: 0x00070052, // Arrow Up
  0x00100000305: 0x0007004d, // End
  0x00100000306: 0x0007004a, // Home
  0x00100000307: 0x0007004e, // Page Down
  0x00100000308: 0x0007004b, // Page Up
  0x00100000402: 0x0007007c, // Copy
  0x00100000404: 0x0007007b, // Cut
  0x00100000407: 0x00070049, // Insert
  0x00100000408: 0x0007007d, // Paste
  0x00100000409: 0x000c0279, // Redo
  0x0010000040a: 0x0007007a, // Undo
  0x00100000502: 0x00070079, // Again
  0x00100000505: 0x00070065, // Context Menu
  0x00100000507: 0x0007007e, // Find
  0x00100000508: 0x00070075, // Help
  0x00100000509: 0x00070048, // Pause
  0x0010000050b: 0x000700a3, // Props
  0x0010000050c: 0x00070077, // Select
  0x0010000050d: 0x000c022d, // Zoom In
  0x0010000050e: 0x000c022e, // Zoom Out
  0x00100000601: 0x000c0070, // Brightness Down
  0x00100000602: 0x000c006f, // Brightness Up
  0x00100000604: 0x000c00b8, // Eject
  0x00100000605: 0x000c019c, // Log Off
  0x00100000606: 0x00070066, // Power
  0x00100000608: 0x00070046, // Print Screen
  0x0010000060b: 0x00010083, // Wake Up
  0x00100000705: 0x0007008a, // Convert
  0x0010000070d: 0x0007008b, // Non Convert
  0x00100000718: 0x00070088, // Kana Mode
  0x00100000801: 0x0007003a, // F1
  0x00100000802: 0x0007003b, // F2
  0x00100000803: 0x0007003c, // F3
  0x00100000804: 0x0007003d, // F4
  0x00100000805: 0x0007003e, // F5
  0x00100000806: 0x0007003f, // F6
  0x00100000807: 0x00070040, // F7
  0x00100000808: 0x00070041, // F8
  0x00100000809: 0x00070042, // F9
  0x0010000080a: 0x00070043, // F10
  0x0010000080b: 0x00070044, // F11
  0x0010000080c: 0x00070045, // F12
  0x0010000080d: 0x00070068, // F13
  0x0010000080e: 0x00070069, // F14
  0x0010000080f: 0x0007006a, // F15
  0x00100000810: 0x0007006b, // F16
  0x00100000811: 0x0007006c, // F17
  0x00100000812: 0x0007006d, // F18
  0x00100000813: 0x0007006e, // F19
  0x00100000814: 0x0007006f, // F20
  0x00100000815: 0x00070070, // F21
  0x00100000816: 0x00070071, // F22
  0x00100000817: 0x00070072, // F23
  0x00100000818: 0x00070073, // F24
  0x00100000a01: 0x000c0203, // Close
  0x00100000a02: 0x000c028b, // Mail Forward
  0x00100000a03: 0x000c0289, // Mail Reply
  0x00100000a04: 0x000c028c, // Mail Send
  0x00100000a05: 0x000c00cd, // Media Play Pause
  0x00100000a07: 0x000c00b7, // Media Stop
  0x00100000a08: 0x000c00b5, // Media Track Next
  0x00100000a09: 0x000c00b6, // Media Track Previous
  0x00100000a0b: 0x00070074, // Open
  0x00100000a0c: 0x000c0208, // Print
  0x00100000a0d: 0x000c0207, // Save
  0x00100000a0e: 0x000c01ab, // Spell Check
  0x00100000a0f: 0x00070081, // Audio Volume Down
  0x00100000a10: 0x00070080, // Audio Volume Up
  0x00100000a11: 0x0007007f, // Audio Volume Mute
  0x00100000b02: 0x000c018e, // Launch Calendar
  0x00100000b03: 0x000c018a, // Launch Mail
  0x00100000b07: 0x000c01b1, // Launch Screen Saver
  0x00100000b08: 0x000c0186, // Launch Spreadsheet
  0x00100000b0b: 0x000c0184, // Launch Word Processor
  0x00100000b0c: 0x000c018d, // Launch Contacts
  0x00100000b0d: 0x000c008c, // Launch Phone
  0x00100000b0e: 0x000c01cb, // Launch Assistant
  0x00100000b0f: 0x000c019f, // Launch Control Panel
  0x00100000c01: 0x000c0224, // Browser Back
  0x00100000c02: 0x000c022a, // Browser Favorites
  0x00100000c03: 0x000c0225, // Browser Forward
  0x00100000c04: 0x000c0223, // Browser Home
  0x00100000c05: 0x000c0227, // Browser Refresh
  0x00100000c06: 0x000c0221, // Browser Search
  0x00100000c07: 0x000c0226, // Browser Stop
  0x00100000d0a: 0x000c009d, // Channel Down
  0x00100000d0b: 0x000c009c, // Channel Up
  0x00100000d12: 0x000c0061, // Closed Caption Toggle
  0x00100000d15: 0x000c0094, // Exit
  0x00100000d25: 0x000c0060, // Info
  0x00100000d2c: 0x000c00b3, // Media Fast Forward
  0x00100000d2d: 0x000c0083, // Media Last
  0x00100000d2e: 0x000c00b1, // Media Pause
  0x00100000d2f: 0x000c00b0, // Media Play
  0x00100000d30: 0x000c00b2, // Media Record
  0x00100000d31: 0x000c00b4, // Media Rewind
  0x00100000d4e: 0x000c0232, // Zoom Toggle
  0x00100000f02: 0x000c00cf, // Speech Input Toggle
  0x00200000000: 0x00000014, // Suspend
  0x00200000001: 0x00000015, // Resume
  0x00200000002: 0x00010082, // Sleep
  0x00200000003: 0x0007009b, // Abort
  0x00200000010: 0x00070090, // Lang 1
  0x00200000011: 0x00070091, // Lang 2
  0x00200000012: 0x00070092, // Lang 3
  0x00200000013: 0x00070093, // Lang 4
  0x00200000014: 0x00070094, // Lang 5
  0x00200000020: 0x00070064, // Intl Backslash
  0x00200000021: 0x00070087, // Intl Ro
  0x00200000022: 0x00070089, // Intl Yen
  0x00200000100: 0x000700e0, // Control Left
  0x00200000101: 0x000700e4, // Control Right
  0x00200000102: 0x000700e1, // Shift Left
  0x00200000103: 0x000700e5, // Shift Right
  0x00200000104: 0x000700e2, // Alt Left
  0x00200000105: 0x000700e6, // Alt Right
  0x00200000106: 0x000700e3, // Meta Left
  0x00200000107: 0x000700e7, // Meta Right
  0x0020000020d: 0x00070058, // Numpad Enter
  0x00200000228: 0x000700b6, // Numpad Paren Left
  0x00200000229: 0x000700b7, // Numpad Paren Right
  0x0020000022a: 0x00070055, // Numpad Multiply
  0x0020000022b: 0x00070057, // Numpad Add
  0x0020000022c: 0x00070085, // Numpad Comma
  0x0020000022d: 0x00070056, // Numpad Subtract
  0x0020000022e: 0x00070063, // Numpad Decimal
  0x0020000022f: 0x00070054, // Numpad Divide
  0x00200000230: 0x00070062, // Numpad 0
  0x00200000231: 0x00070059, // Numpad 1
  0x00200000232: 0x0007005a, // Numpad 2
  0x00200000233: 0x0007005b, // Numpad 3
  0x00200000234: 0x0007005c, // Numpad 4
  0x00200000235: 0x0007005d, // Numpad 5
  0x00200000236: 0x0007005e, // Numpad 6
  0x00200000237: 0x0007005f, // Numpad 7
  0x00200000238: 0x00070060, // Numpad 8
  0x00200000239: 0x00070061, // Numpad 9
  0x0020000023d: 0x00070067, // Numpad Equal
  0x00200000301: 0x0005ff01, // Game Button 1
  0x00200000302: 0x0005ff02, // Game Button 2
  0x00200000303: 0x0005ff03, // Game Button 3
  0x00200000304: 0x0005ff04, // Game Button 4
  0x00200000305: 0x0005ff05, // Game Button 5
  0x00200000306: 0x0005ff06, // Game Button 6
  0x00200000307: 0x0005ff07, // Game Button 7
  0x00200000308: 0x0005ff08, // Game Button 8
  0x00200000309: 0x0005ff09, // Game Button 9
  0x0020000030a: 0x0005ff0a, // Game Button 10
  0x0020000030b: 0x0005ff0b, // Game Button 11
  0x0020000030c: 0x0005ff0c, // Game Button 12
  0x0020000030d: 0x0005ff0d, // Game Button 13
  0x0020000030e: 0x0005ff0e, // Game Button 14
  0x0020000030f: 0x0005ff0f, // Game Button 15
  0x00200000310: 0x0005ff10, // Game Button 16
  0x00200000311: 0x0005ff11, // Game Button A
  0x00200000312: 0x0005ff12, // Game Button B
  0x00200000313: 0x0005ff13, // Game Button C
  0x00200000314: 0x0005ff14, // Game Button Left 1
  0x00200000315: 0x0005ff15, // Game Button Left 2
  0x00200000316: 0x0005ff16, // Game Button Mode
  0x00200000317: 0x0005ff17, // Game Button Right 1
  0x00200000318: 0x0005ff18, // Game Button Right 2
  0x00200000319: 0x0005ff19, // Game Button Select
  0x0020000031a: 0x0005ff1a, // Game Button Start
  0x0020000031b: 0x0005ff1b, // Game Button Thumb Left
  0x0020000031c: 0x0005ff1c, // Game Button Thumb Right
  0x0020000031d: 0x0005ff1d, // Game Button X
  0x0020000031e: 0x0005ff1e, // Game Button Y
  0x0020000031f: 0x0005ff1f, // Game Button Z
};

final Map<PhysicalKeyboardKey, String> _knownKeyLabels =
    <PhysicalKeyboardKey, String>{
  PhysicalKeyboardKey.keyA: 'A',
  PhysicalKeyboardKey.keyB: 'B',
  PhysicalKeyboardKey.keyC: 'C',
  PhysicalKeyboardKey.keyD: 'D',
  PhysicalKeyboardKey.keyE: 'E',
  PhysicalKeyboardKey.keyF: 'F',
  PhysicalKeyboardKey.keyG: 'G',
  PhysicalKeyboardKey.keyH: 'H',
  PhysicalKeyboardKey.keyI: 'I',
  PhysicalKeyboardKey.keyJ: 'J',
  PhysicalKeyboardKey.keyK: 'K',
  PhysicalKeyboardKey.keyL: 'L',
  PhysicalKeyboardKey.keyM: 'M',
  PhysicalKeyboardKey.keyN: 'N',
  PhysicalKeyboardKey.keyO: 'O',
  PhysicalKeyboardKey.keyP: 'P',
  PhysicalKeyboardKey.keyQ: 'Q',
  PhysicalKeyboardKey.keyR: 'R',
  PhysicalKeyboardKey.keyS: 'S',
  PhysicalKeyboardKey.keyT: 'T',
  PhysicalKeyboardKey.keyU: 'U',
  PhysicalKeyboardKey.keyV: 'V',
  PhysicalKeyboardKey.keyW: 'W',
  PhysicalKeyboardKey.keyX: 'X',
  PhysicalKeyboardKey.keyY: 'Y',
  PhysicalKeyboardKey.keyZ: 'Z',
  PhysicalKeyboardKey.digit1: '1',
  PhysicalKeyboardKey.digit2: '2',
  PhysicalKeyboardKey.digit3: '3',
  PhysicalKeyboardKey.digit4: '4',
  PhysicalKeyboardKey.digit5: '5',
  PhysicalKeyboardKey.digit6: '6',
  PhysicalKeyboardKey.digit7: '7',
  PhysicalKeyboardKey.digit8: '8',
  PhysicalKeyboardKey.digit9: '9',
  PhysicalKeyboardKey.digit0: '0',
  PhysicalKeyboardKey.enter: '↩︎',
  PhysicalKeyboardKey.escape: '⎋',
  PhysicalKeyboardKey.backspace: '←',
  PhysicalKeyboardKey.tab: '⇥',
  PhysicalKeyboardKey.space: '␣',
  PhysicalKeyboardKey.minus: '-',
  PhysicalKeyboardKey.equal: '=',
  PhysicalKeyboardKey.bracketLeft: '[',
  PhysicalKeyboardKey.bracketRight: ']',
  PhysicalKeyboardKey.backslash: r'\',
  PhysicalKeyboardKey.semicolon: ';',
  PhysicalKeyboardKey.quote: '"',
  PhysicalKeyboardKey.backquote: '`',
  PhysicalKeyboardKey.comma: ',',
  PhysicalKeyboardKey.period: '.',
  PhysicalKeyboardKey.slash: '/',
  PhysicalKeyboardKey.capsLock: '⇪',
  PhysicalKeyboardKey.f1: 'F1',
  PhysicalKeyboardKey.f2: 'F2',
  PhysicalKeyboardKey.f3: 'F3',
  PhysicalKeyboardKey.f4: 'F4',
  PhysicalKeyboardKey.f5: 'F5',
  PhysicalKeyboardKey.f6: 'F6',
  PhysicalKeyboardKey.f7: 'F7',
  PhysicalKeyboardKey.f8: 'F8',
  PhysicalKeyboardKey.f9: 'F9',
  PhysicalKeyboardKey.f10: 'F10',
  PhysicalKeyboardKey.f11: 'F11',
  PhysicalKeyboardKey.f12: 'F12',
  PhysicalKeyboardKey.home: '↖',
  PhysicalKeyboardKey.pageUp: '⇞',
  PhysicalKeyboardKey.delete: '⌫',
  PhysicalKeyboardKey.end: '↘',
  PhysicalKeyboardKey.pageDown: '⇟',
  PhysicalKeyboardKey.arrowRight: '→',
  PhysicalKeyboardKey.arrowLeft: '←',
  PhysicalKeyboardKey.arrowDown: '↓',
  PhysicalKeyboardKey.arrowUp: '↑',
  PhysicalKeyboardKey.controlLeft: '⌃',
  PhysicalKeyboardKey.shiftLeft: '⇧',
  PhysicalKeyboardKey.altLeft: '⌥',
  PhysicalKeyboardKey.metaLeft: (!kIsWeb && Platform.isMacOS) ? '⌘' : '⊞',
  PhysicalKeyboardKey.controlRight: '⌃',
  PhysicalKeyboardKey.shiftRight: '⇧',
  PhysicalKeyboardKey.altRight: '⌥',
  PhysicalKeyboardKey.metaRight: (!kIsWeb && Platform.isMacOS) ? '⌘' : '⊞',
  PhysicalKeyboardKey.fn: 'fn',
};

extension _ExtendedIterable<T> on Iterable<T> {
  /// The first element satisfying [test], or `null` if there are none.
  T? firstWhereOrNull(bool Function(T element) test) {
    for (final element in this) {
      if (test(element)) return element;
    }
    return null;
  }
}

/// Extension methods for [LogicalKeyboardKey].
extension ExtendedLogicalKeyboardKey on LogicalKeyboardKey {
  PhysicalKeyboardKey? get physicalKey {
    final usageCode = _keymap.entries
        .firstWhereOrNull(
          (entry) => entry.key == keyId,
        )
        ?.value;
    if (usageCode == null) return null;
    return PhysicalKeyboardKey.findKeyByCode(usageCode);
  }
}

/// Extension methods for [PhysicalKeyboardKey].
extension ExtendedPhysicalKeyboardKey on PhysicalKeyboardKey {
  LogicalKeyboardKey? get logicalKey {
    final keyId = _keymap.entries
        .firstWhereOrNull((entry) => entry.value == usbHidUsage)
        ?.key;
    if (keyId == null) return null;
    return LogicalKeyboardKey.findKeyByKeyId(keyId);
  }

  /// Returns the [keyCode] of this [PhysicalKeyboardKey].
  int? get keyCode {
    return UniPlatform.call<int?>(
      linux: () {
        final matchedKeyCode = kGtkToLogicalKey.entries
            .firstWhereOrNull((entry) => entry.value == logicalKey)
            ?.key;
        if (matchedKeyCode != null) return matchedKeyCode;
        return logicalKey?.keyId;
      },
      macos: () {
        return kMacOsToPhysicalKey.entries
            .firstWhereOrNull((entry) => entry.value == this)
            ?.key;
      },
      windows: () {
        return kWindowsToLogicalKey.entries
            .firstWhereOrNull((entry) => entry.value == logicalKey)
            ?.key;
      },
    );
  }
}

extension KeyboardKeyExt on KeyboardKey {
  String get label {
    PhysicalKeyboardKey? physicalKey;
    if (this is LogicalKeyboardKey) {
      physicalKey = (this as LogicalKeyboardKey).physicalKey;
    } else if (this is PhysicalKeyboardKey) {
      physicalKey = this as PhysicalKeyboardKey;
    }
    return _knownKeyLabels[physicalKey] ?? physicalKey?.debugName ?? 'Unknown';
  }
}
