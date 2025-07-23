# Setup Android

## Release

```shell
# The build target is the .apk package
make ENV=<dev|stg|prod> apk
```

```shell
# The build target is the .aab package
make ENV=<dev|stg|prod> appbundle
```

[//]: # (## Tests)

[//]: # ()

[//]: # (### Deep Links on Android &#40;app links&#41;)

[//]: # ()

[//]: # (```shell)

[//]: # (adb shell am start -a android.intent.action.VIEW -d "pg://debug")

[//]: # (```)
