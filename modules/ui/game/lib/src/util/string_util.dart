/// string utils
class StringUtil {
  static const empty = '';

  static const space = ' ';

  /// 连字符
  static const hyphen = '-';

  static bool isBlank(String? str) {
    return str == null || str.isEmpty || str.trim().isEmpty;
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

  static String getValue(String? str, {String defaultVal = empty}) {
    return isBlank(str) ? defaultVal : str!;
  }

  static String getHyphenValue(String? str) {
    return getValue(str, defaultVal: hyphen);
  }
}
