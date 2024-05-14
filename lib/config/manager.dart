
class AppManager {
  /// 私有构造器
  AppManager._();

  String? version;
  String? prodVersion;
  String? buildNumber;

  /// 静态变量指向自身
  static final AppManager _instance = AppManager._();

  /// 静态属性获得实例变量
  static AppManager get instance => _instance;
}
