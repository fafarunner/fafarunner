import 'dart:ui';

class ColorUtil {
  static const int black = 0xFF000000;
  static const int dkgray = 0xFF444444;
  static const int gray = 0xFF888888;
  static const int ltgray = 0xFFCCCCCC;
  static const int white = 0xFFFFFFFF;
  static const int red = 0xFFFF0000;
  static const int green = 0xFF00FF00;
  static const int blue = 0xFF0000FF;
  static const int yellow = 0xFFFFFF00;
  static const int cyan = 0xFF00FFFF;
  static const int magenta = 0xFFFF00FF;
  static const int transparent = 0;

  /// Parse the color string, and return the corresponding color-int.
  /// If the string cannot be parsed, throws an ArgumentError
  static int? intColor(String colorString) {
    if (colorString.isEmpty) {
      throw ArgumentError('Unknown color');
    }
    if (colorString[0] == '#') {
      var color = int.tryParse(colorString.substring(1), radix: 16);
      if (colorString.length == 7) {
        // Set the alpha value
        if(color != null) {
          color |= 0x00000000ff000000;
        }
      } else if (colorString.length != 9) {
        throw ArgumentError('Unknown color');
      }
      return color;
    } else {
      var color = sColorNameMap[(colorString.toLowerCase())];
      if (color != null) {
        return color;
      } else {
        return intColor('#' + colorString);
      }
    }
  }

  /// Parse the color string, and return the corresponding color.
  /// If the string cannot be parsed, throws an ArgumentError
  static Color color(String colorString) {
    return Color(intColor(colorString)!);
  }

  static const sColorNameMap = {
    'black': black,
    'darkgray': dkgray,
    'gray': gray,
    'lightgray': ltgray,
    'white': white,
    'red': red,
    'green': green,
    'blue': blue,
    'yellow': yellow,
    'cyan': cyan,
    'magenta': magenta,
    'aqua': 0xFF00FFFF,
    'fuchsia': 0xFFFF00FF,
    'darkgrey': dkgray,
    'grey': gray,
    'lightgrey': ltgray,
    'lime': 0xFF00FF00,
    'maroon': 0xFF800000,
    'navy': 0xFF000080,
    'olive': 0xFF808000,
    'purple': 0xFF800080,
    'silver': 0xFFC0C0C0,
    'teal': 0xFF008080
  };
}
