#!/bin/bash
set -eu

if ! command -v wget >/dev/null 2>&1; then
   echo "🟩 Installing wget"
   sudo apt install wget xz-utils -y
fi

FLUTTER_DIR="$RUNNER_TEMP"

if [ ! -d "$FLUTTER_DIR" ]; then
   echo "🟩 flutter directory created"
   mkdir -p "$FLUTTER_DIR"
fi

if [ ! -f "$FLUTTER_DIR/flutter-3.24.4-aarch64.tar.xz" ]; then
   echo "🟩 Downloading Flutter"
   wget https://github.com/containerbase/flutter-prebuild/releases/download/3.24.4/flutter-3.24.4-aarch64.tar.xz -P "$FLUTTER_DIR"
fi

if [ -d "$FLUTTER_DIR/flutter" ]; then
   echo "🟩 Removing flutter directory"
   rm -rf "$FLUTTER_DIR/flutter"
fi

echo "🟩 Unzipping"
mkdir "$FLUTTER_DIR/flutter" && tar -xf "$FLUTTER_DIR/flutter-3.24.4-aarch64.tar.xz" -C "$FLUTTER_DIR/flutter" --strip-components 1

echo "🟩 Config $FLUTTER_DIR/flutter"
git config --global --add safe.directory "$FLUTTER_DIR/flutter"

{
	echo "FLUTTER_ROOT=$FLUTTER_DIR/flutter"
	echo "PUB_CACHE=$HOME/.pub-cache"
} >>"${GITHUB_ENV:-/dev/null}"

{
	echo "$FLUTTER_DIR/flutter/bin"
	echo "$FLUTTER_DIR/flutter/bin/cache/dart-sdk/bin"
	echo "$HOME/.pub-cache/bin"
} >>"${GITHUB_PATH:-/dev/null}"
