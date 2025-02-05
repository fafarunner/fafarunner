# Quick Start

Platform: x86, x64, arm64<br>
Configuration: Debug, Release

## Environment Variables

```powershell
$env:Platform = "x64"
$env:Configuration = "Release"
$env:IconPath = "$pwd\windows\runner\resources\app_icon.ico"
$env:FLUTTER_BUILD_OUTPUT_DIR = "$pwd\build\windows\$env:Platform\runner\Release"
```

## Build

```powershell
heat dir "$pwd\build\windows\$env:Platform\runner\Release\data\flutter_assets" -cg FlutterAssetsComponents -gg -o "$pwd\msi\fafarunner\fafarunner\FlutterAssets.wxs"

dotnet build .\msi\fafarunner\fafarunner\fafarunner.wixproj --arch "$env:Platform" --configuration "$env:Configuration"
```

## Output

```
msi\fafarunner\fafarunner\bin\$env:Platform\$env:Configuration\en-US
```

## Debug

```text
<DefineConstants>FlutterBuildOutputDir=..\..\..\build\windows\x64\runner\Release</DefineConstants>
```
