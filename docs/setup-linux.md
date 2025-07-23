# Setup Linux

## Release

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
sudo snap install ./fafarunner_1.0.0_amd64.snap --dangerous
```
