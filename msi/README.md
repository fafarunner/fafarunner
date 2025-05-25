# Quick Start

Platform: x86, x64, arm64<br>
Configuration: Debug, Release

## Environment Variables

```powershell
$env:Platform = "x64"
$env:Configuration = "Release"
$env:IconPath = "$pwd\windows\runner\resources\app_icon.ico"
$env:FLUTTER_BUILD_OUTPUT_DIR = "$pwd\build\windows\$env:Platform\runner\Release"
$env:LicensePath = "$env:FLUTTER_BUILD_OUTPUT_DIR\LICENSE.rtf"
```

## Build

```powershell
python preprocess.py --arp -d ../build/windows/x64/runner/Release -i ../windows/runner/resources/app_icon.ico -v 1.0.0.1

nuget restore fafarunner.sln

& "C:\Program Files\Microsoft Visual Studio\2022\Professional\MSBuild\Current\Bin\MSBuild.exe" fafarunner.sln -p:Configuration="$env:Configuration" -p:Platform="$env:Platform" /p:TargetVersion=Windows10
```

## Output

```
msi\fafarunner\bin\$env:Platform\$env:Configuration\en-US
```
