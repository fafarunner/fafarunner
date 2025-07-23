# Setup iOS

## Requirements

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

```shell
# Publish to test environment
make ENV=<dev|stg|prod> adhoc
```

```shell
# Release to production environment
make ENV=<dev|stg|prod> appstore
```

[//]: # (## Tests)

[//]: # ()
[//]: # (#### Custom URL schemes on iOS)

[//]: # ()
[//]: # (```shell)

[//]: # (/usr/bin/xcrun simctl openurl booted "pg://debug")

[//]: # (```)
