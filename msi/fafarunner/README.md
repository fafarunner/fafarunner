# Quick Start

## Environment Variables

arch: x86, x64, arm64

### Local Development

```powershell
$env:FLUTTER_BUILD_OUTPUT_DIR = "$pwd\build\windows\x64\runner\Release"
$env:VISUAL_STUDIO_REDIST_DIR = "C:\Program Files\Microsoft Visual Studio\2022\Professional\VC\Redist\MSVC\14.40.33807\${arch}\Microsoft.VC143.CRT"
```

### Github Action

```powershell
$env:FLUTTER_BUILD_OUTPUT_DIR = "$pwd\build\windows\x64\runner\Release"
$env:VISUAL_STUDIO_REDIST_DIR = "C:\Program Files\Microsoft Visual Studio\2022\Enterprise\VC\Redist\MSVC\14.40.33807\${arch}\Microsoft.VC143.CRT"
```

## Build

```powershell
heat dir "$pwd\build\windows\x64\runner\Release\data\flutter_assets\assets" -cg AssetComponents -gg -o AppAssets.wxs
```

```powershell
dotnet build .\msi\fafarunner\fafarunner.wixproj --arch x64 --configuration Release
```

## Output

configuration: Debug, Release

msi\fafarunner\bin\${configuration}\en-US

## Debug

```text
<DefineConstants>FlutterBuildOutputDir=..\..\build\windows\x64\runner\Release;VisualStudoRedistDir=C:\Program Files\Microsoft Visual Studio\2022\Professional\VC\Redist\MSVC\14.40.33807\x86\Microsoft.VC143.CRT</DefineConstants>
```
