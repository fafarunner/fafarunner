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
  --eula "eula.rtf" \
  --window-pos 200 120 \
  --window-size 600 400 \
  --icon-size 100 \
  --icon "FaFa Runner.app" 200 180 \
  --hide-extension "FaFa Runner.app" \
  --app-drop-link 400 180 \
  "FaFa Runner.dmg" \
  "build/macos/Build/Products/Release/FaFa Runner.app"

exit 0
