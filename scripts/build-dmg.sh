#!/bin/zsh

set -e

if ! command -v create-dmg >/dev/null 2>&1; then
   echo "🟩 Installing create-dmg"
   HOMEBREW_NO_AUTO_UPDATE=1 brew install create-dmg
fi

create-dmg --version

test -f FaFa\ Runner.dmg && rm -f FaFa\ Runner.dmg

create-dmg \
  --volname "FaFa Runner" \
  --volicon "logo/fafa-runner.icns" \
  --background "images/background.png" \
  --eula "eula.rtf" \
  --window-pos 200 180 \
  --window-size 660 500 \
  --icon-size 100 \
  --icon "FaFa Runner.app" 180 170 \
  --hide-extension "FaFa Runner.app" \
  --app-drop-link 480 170 \
  "FaFa Runner.dmg" \
  "build/macos/Build/Products/Release/FaFa Runner.app"

exit 0
