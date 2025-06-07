#!/bin/bash

set -eu

if ! command -v git >/dev/null 2>&1; then
   echo "🟩 Installing git"
   sudo apt-get install -y git
fi

FLUTTER_DIR="$RUNNER_TEMP"

if [ ! -d "$FLUTTER_DIR" ]; then
   echo "🟩 flutter directory created"
   mkdir -p "$FLUTTER_DIR"
fi

if [ -d "$FLUTTER_DIR/flutter" ]; then
   echo "🟩 Removing flutter directory"
   rm -rf "$FLUTTER_DIR/flutter"
fi

echo "🟩 Cloning"
mkdir -p "$FLUTTER_DIR/flutter" && git clone --depth 1 -b 3.32.2 https://github.com/flutter/flutter.git "$FLUTTER_DIR/flutter"

echo "🟩 Config $FLUTTER_DIR/flutter"
git config --global --add safe.directory "$FLUTTER_DIR/flutter"

# https://github.com/canonical/snapcraft/pull/5264
# Fixed in 3.29.1
#rm -f "$FLUTTER_DIR/flutter/engine/src/.gn"

{
	echo "FLUTTER_ROOT=$FLUTTER_DIR/flutter"
	echo "PUB_CACHE=$HOME/.pub-cache"
} >>"${GITHUB_ENV:-/dev/null}"

{
	echo "$FLUTTER_DIR/flutter/bin"
	echo "$FLUTTER_DIR/flutter/bin/cache/dart-sdk/bin"
	echo "$HOME/.pub-cache/bin"
} >>"${GITHUB_PATH:-/dev/null}"
