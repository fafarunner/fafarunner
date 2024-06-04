#!/bin/sh

set -e

if ! command -v wget >/dev/null 2>&1; then
   echo "🟩 Installing wget"
   sudo apt install wget -y
fi

PG_FLUTTER_BUILD_DIR="$CRAFT_PART_BUILD/flutter-distro"

if [ ! -f "$CRAFT_PART_BUILD/flutter-3.19.6-aarch64.tar.xz" ]; then
   echo "🟩 Downloading Flutter"
   wget https://github.com/containerbase/flutter-prebuild/releases/download/3.19.6/flutter-3.19.6-aarch64.tar.xz -P "$CRAFT_PART_BUILD"
fi

if [ -d "$PG_FLUTTER_BUILD_DIR" ]; then
   echo "🟩 Removing flutter directory"
   rm -rf "$PG_FLUTTER_BUILD_DIR"
fi

echo "🟩 Unzipping"
mkdir -p "$PG_FLUTTER_BUILD_DIR" && tar -xf "$CRAFT_PART_BUILD/flutter-3.19.6-aarch64.tar.xz" -C "$PG_FLUTTER_BUILD_DIR" --strip-components 1

echo "🟩 Config $PG_FLUTTER_BUILD_DIR"
git config --global --add safe.directory "$PG_FLUTTER_BUILD_DIR"

echo "🟩 Running ls"
ls

exit 0
