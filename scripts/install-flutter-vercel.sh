#!/bin/sh

set -e

if ! command -v wget >/dev/null 2>&1; then
   echo "🟩 Installing wget"
   yum install -y wget xz
fi

FLUTTER_DIR="$PWD"

if [ ! -f "$FLUTTER_DIR/flutter_linux_3.41.7-stable.tar.xz" ]; then
   echo "🟩 Downloading Flutter"
   wget https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.41.7-stable.tar.xz -P "$FLUTTER_DIR"
fi

if [ -d "$FLUTTER_DIR/flutter" ]; then
   echo "🟩 Removing flutter directory"
   rm -rf "$FLUTTER_DIR/flutter"
fi

echo "🟩 Unzipping"
mkdir "$FLUTTER_DIR/flutter" && tar -xf "$FLUTTER_DIR/flutter_linux_3.41.7-stable.tar.xz" -C "$FLUTTER_DIR/flutter" --strip-components 1

echo "🟩 Config $FLUTTER_DIR/flutter"
git config --global --add safe.directory "$FLUTTER_DIR/flutter"

# https://github.com/canonical/snapcraft/pull/5264
# Fixed in 3.29.1
#rm -f "$FLUTTER_DIR/flutter/engine/src/.gn"

echo "🟩 Running ls"
ls

echo "🟩 Running flutter doctor -v"
flutter/bin/flutter doctor -v

echo "🟩 Cleaning the project..."
flutter/bin/flutter clean

echo "🟩 Install Flutter Dependencies"
flutter/bin/flutter pub get

exit 0
