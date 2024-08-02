# FaFa Runner

[![Test](https://github.com/fafarunner/fafarunner/actions/workflows/test.yml/badge.svg)](https://github.com/fafarunner/fafarunner/actions/workflows/test.yml)
[![Release](https://github.com/fafarunner/fafarunner/actions/workflows/release.yml/badge.svg)](https://github.com/fafarunner/fafarunner/actions/workflows/release.yml)
[![GitHub Release](https://img.shields.io/github/v/release/fafarunner/fafarunner)](https://github.com/fafarunner/fafarunner/releases/latest)
[![GitHub Issues or Pull Requests](https://img.shields.io/github/issues/fafarunner/fafarunner)](https://github.com/fafarunner/fafarunner/issues/new)
[![GitHub License](https://img.shields.io/github/license/fafarunner/fafarunner)](https://raw.githubusercontent.com/fafarunner/fafarunner/main/LICENSE)

## Requirements

### iOS

```shell
# 1. 导入证书
security import ./<name>.cer -P <password> -A -t cert

# 2. 导入.p12私钥
security import ./<name>.p12 -P <password> -A -t cert -f pkcs12

# 3. 双击导入mobileprovision文件
```

```shell
# 手动安装模拟器运行时
# 已安装列表
xcrun simctl runtime list

# 安装
xcrun simctl runtime add "~/iOS_17.0.1_Simulator_Runtime.dmg"
```

## Release

以下脚本都在`Makefile`文件下，JetBrains / Android Studio可能需要安装`Makefile Language`插件。

### Flutter

>在`pubspec.yaml`文件修改`version: <new version>`

### Android

>如果发布到生产环境, 请在`android/app/build.gradle`文件修改`versionCode`

```shell
# 如果发布到测试环境
make ENV=<dev|stg|prod> apk
```

```shell
# 如果发布到生产环境
make ENV=<dev|stg|prod> appbundle
```

### iOS

>如果发布到生产环境, 请修改`build`号

```shell
# 如果发布到测试环境
make ENV=<dev|stg|prod> adhoc
```

```shell
# 如果发布到生产环境
make ENV=<dev|stg|prod> appstore
```

### macOS

1. The build target is in `dmg` format and the certificate type is `Developer ID Application`

2. The build target is in `pkg` format and the certificate types are `Developer ID Application` and `Developer ID Installer`

3. The build target is in `pkg` format, distributed to Mac App Store, and the certificate types are `Mac App Distribution` and `Mac Installer Distribution`

4. The build target is in `zip` format and the certificate type is `Developer ID Application`

>如果发布到生产环境, 请修改`build`号

```shell
# 如果发布到测试环境
make ENV=<dev|stg|prod> macos_adhoc
```

```shell
# 如果发布到生产环境
make ENV=<dev|stg|prod> macos_appstore
```

```shell
# build & sign pkg
# developer id installer
xcrun pkgbuild --component "./FaFa Runner.app" --install-location /Applications --sign "" FaFa\ Runner.pkg

# Notarize pkg
xcrun notarytool submit --verbose FaFa\ Runner.pkg --apple-id "" --team-id "" --password ""
xcrun notarytool info <id> --apple-id "" --team-id "" --password ""
xcrun notarytool log <id> --apple-id "" --team-id "" --password ""
```

### Linux

```shell
# https://distributor.leanflutter.dev/makers/appimage/
dart run flutter_distributor:main package --platform linux --targets appimage

# https://flutter.cn/docs/deployment/linux
# https://snapcraft.io/docs/snapcraft-yaml-reference
snapcraft

# Test snap
sudo snap install ./fafarunner.snap --dangerous
```

### Windows

```powershell
$PFX_FILE = get-content 'C:\temp\cert.pfx' -Encoding Byte
$base64 = [System.Convert]::ToBase64String($PFX_FILE) | Out-File 'C:\temp\certBase64.txt'

$BASE64_STR = get-content 'C:\temp\certBase64.txt'
$filename = 'C:\temp\dummy-3.pfx'
$bytes = [Convert]::FromBase64String($BASE64_STR)
[IO.File]::WriteAllBytes($filename, $bytes)
```

```powershell
# https://jrsoftware.org/isinfo.php
# https://distributor.leanflutter.dev/zh-hans/makers/exe/
flutter_distributor package --platform windows --targets exe

# https://flutter.cn/docs/platform-integration/windows/building#msix-packaging
# https://distributor.leanflutter.dev/zh-hans/makers/msix/
flutter_distributor package --platform windows --targets msix
```

## Tests

### app links

#### Deep Links on Android

```shell
adb shell am start -a android.intent.action.VIEW -d "fr://debug"
```

#### Custom URL schemes on iOS

```shell
/usr/bin/xcrun simctl openurl booted "fr://debug"
```
