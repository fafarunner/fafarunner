class AppManager {
  /// 私有构造器
  AppManager.internal();

  // String? version;
  // String? buildNumber;

  /// 静态变量指向自身
  static final AppManager _instance = AppManager.internal();

  /// 静态属性获得实例变量
  static AppManager get instance => _instance;
}
