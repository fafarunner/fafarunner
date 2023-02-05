
import 'package:flutter/widgets.dart';

class AppManager {
  String? username;
  String? password;
  String? token;
  String? version;
  String? buildNumber;
  BuildContext? context;

  /// 静态变量指向自身
  static final AppManager _instance = AppManager._();

  /// 私有构造器
  AppManager._();

  /// 静态属性获得实例变量
  static AppManager get instance => _instance;

}
