import 'package:event_bus/event_bus.dart';
import 'package:package_info_plus/package_info_plus.dart';

/// app info
Future<PackageInfo> initAppInfo() async {
  return PackageInfo.fromPlatform();
}

///
EventBus eventBus = EventBus();
