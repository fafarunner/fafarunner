#!/bin/zsh

set -e

if ! command -v create-dmg >/dev/null 2>&1; then
   echo "🟩 Installing create-dmg"
   HOMEBREW_NO_AUTO_UPDATE=1 brew install create-dmg
fi

create-dmg --version

APP_NAME="FaFa Runner"
BASE_APP_DIR="$APP_NAME.app"
APP_FILE_NAME="$APP_NAME.dmg"
PACK_DIR="macos/packaging"
TARGET_DIR="build/macos/Build/Products/Release"

test -f "$APP_FILE_NAME" && rm -f "$APP_FILE_NAME"

create-dmg \
  --volname "$APP_NAME" \
  --volicon "$PACK_DIR/dmg/logo.icns" \
  --background "$PACK_DIR/dmg/background.png" \
  --eula "$PACK_DIR/base/eula.rtf" \
  --window-pos 200 180 \
  --window-size 660 500 \
  --icon-size 100 \
  --icon "$BASE_APP_DIR" 180 170 \
  --hide-extension "$BASE_APP_DIR" \
  --app-drop-link 480 170 \
  "$APP_FILE_NAME" \
  "$TARGET_DIR/$BASE_APP_DIR"

exit 0
