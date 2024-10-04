# Quick Start

## Environment Variables

platform: x86, x64, arm64

### Local Development

```powershell
$env:Platform = "x64"
$env:IconPath = "$pwd\windows\runner\resources\app_icon.ico"
$env:FLUTTER_BUILD_OUTPUT_DIR = "$pwd\build\windows\$env:Platform\runner\Release"
$env:VISUAL_STUDIO_REDIST_DIR = "C:\Program Files\Microsoft Visual Studio\2022\Professional\VC\Redist\MSVC\14.40.33807\$env:Platform\Microsoft.VC143.CRT"
```

### Github Action

```powershell
$env:Platform = "x64"
$env:IconPath = "$pwd\windows\runner\resources\app_icon.ico"
$env:FLUTTER_BUILD_OUTPUT_DIR = "$pwd\build\windows\$env:Platform\runner\Release"
$env:VISUAL_STUDIO_REDIST_DIR = "C:\Program Files\Microsoft Visual Studio\2022\Enterprise\VC\Redist\MSVC\14.40.33807\$env:Platform\Microsoft.VC143.CRT"
```

## Build

```powershell
heat dir "$pwd\build\windows\$env:Platform\runner\Release\data\flutter_assets\assets" -cg AssetComponents -gg -o "$pwd\msi\fafarunner\fafarunner\AppAssets.wxs"
```

```powershell
dotnet build .\msi\fafarunner\fafarunner\fafarunner.wixproj --arch "$env:Platform" --configuration Release
```

## Output

configuration: Debug, Release

msi\fafarunner\fafarunner\bin\$env:Platform\${configuration}\en-US

## Debug

```text
<DefineConstants>FlutterBuildOutputDir=..\..\..\build\windows\x64\runner\Release;VisualStudoRedistDir=C:\Program Files\Microsoft Visual Studio\2022\Professional\VC\Redist\MSVC\14.40.33807\x86\Microsoft.VC143.CRT</DefineConstants>
```
