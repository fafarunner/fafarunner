# Development

## Requirements

### iOS

```shell
# 1. Import certificate manually
security import ./<name>.cer -P <password> -A -t cert

# 2. Import .p12 private key manually
security import ./<name>.p12 -P <password> -A -t cert -f pkcs12

# 3. Double-click to import the .mobileprovision file
```

```shell
# Install the simulator runtime manually
# Installed list
xcrun simctl runtime list

# Install the emulator runtime
xcrun simctl runtime add "~/iOS_17.0.1_Simulator_Runtime.dmg"
```

## Release

The following scripts are all under the `Makefile` file. JetBrains IDEA / Android Studio needs to install the `Makefile Language` plug-in.

### Flutter

> Modify `version: <new version>` in the `pubspec.yaml` file

### Android

```shell
# The build target is the .apk package
make ENV=<dev|stg|prod> apk
```

```shell
# The build target is the .aab package
make ENV=<dev|stg|prod> appbundle
```

### iOS

```shell
# Publish to test environment
make ENV=<dev|stg|prod> adhoc
```

```shell
# Release to production environment
make ENV=<dev|stg|prod> appstore
```

### macOS

> Requires a .p12 file containing the certificate

1. The build target is in `dmg` format and the certificate type is `Developer ID Application`

2. The build target is in `pkg` format and the certificate types are `Developer ID Application` and `Developer ID Installer`

3. The build target is in `pkg` format, distributed to Mac App Store, and the certificate types are `Mac App Distribution` and `Mac Installer Distribution`

4. The build target is in `zip` format and the certificate type is `Developer ID Application`

```shell
# Publish to test environment
make ENV=<dev|stg|prod> macos_adhoc
```

```shell
# Release to production environment
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
dart run fastforge:main package --platform linux --targets appimage

# https://flutter.cn/docs/deployment/linux
# https://snapcraft.io/docs/snapcraft-yaml-reference
snapcraft

# upload a snap to snap store
# https://snapcraft.io/docs/releasing-your-app
# https://snapcraft.io/docs/channels
snapcraft upload --release=latest/edge fafarunner_1.0.0_amd64.snap

# Test snap
sudo snap install ./fafarunner.snap --dangerous
```

### Windows

> Self-signed .pfx certificate information format <br>
> subject=C=`<Country Name (2 letter code)>`, ST=`<State or Province Name>`, L=`<Locality Name>`, O=`<Publisher Name>`, OU=`<Publisher Name>`, CN=`<Publisher Name>`, emailAddress=`<Email Address>`

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
fastforge package --platform windows --targets exe

# https://flutter.cn/docs/platform-integration/windows/building#msix-packaging
# https://distributor.leanflutter.dev/zh-hans/makers/msix/
fastforge package --platform windows --targets msix
```

[//]: # (## Tests)

[//]: # ()
[//]: # (### app links)

[//]: # ()
[//]: # (#### Deep Links on Android)

[//]: # ()
[//]: # (```shell)

[//]: # (adb shell am start -a android.intent.action.VIEW -d "fr://debug")

[//]: # (```)

[//]: # ()
[//]: # (#### Custom URL schemes on iOS)

[//]: # ()
[//]: # (```shell)

[//]: # (/usr/bin/xcrun simctl openurl booted "fr://debug")

[//]: # (```)
