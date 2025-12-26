import 'package:event_bus/event_bus.dart';
import 'package:package_info_plus/package_info_plus.dart';

/// app info
Future<PackageInfo> initAppInfo() async {
  return PackageInfo.fromPlatform();
}

/// commit sha
String initCommitSha() {
  final String commitSha = const String.fromEnvironment('GIT_COMMIT_SHA');
  return commitSha;
}

///
EventBus eventBus = EventBus();
