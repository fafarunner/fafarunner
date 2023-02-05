
/// string utils
class StringUtil {
  static const empty = '';

  static const space = ' ';

  static bool isBlank(String? str) {
    return str == null || str.isEmpty;
  }

  static bool isNotBlank(String? str) {
    return !isBlank(str);
  }

  static bool isNull(String? str) {
    return str == null;
  }

  static bool isNotNull(String? str) {
    return !isNull(str);
  }
}
