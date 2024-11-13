#!/bin/sh

set -e

if ! command -v sudo >/dev/null 2>&1; then
   echo "🟩 Installing sudo"
   apt install sudo -y
fi

if ! command -v wget >/dev/null 2>&1; then
   echo "🟩 Installing wget"
   sudo apt install wget -y
fi

if ! command -v git >/dev/null 2>&1; then
   echo "🟩 Installing git"
   sudo apt install git -y
fi

PG_FLUTTER_BUILD_DIR="$CRAFT_PART_BUILD/flutter-distro"

HOST_ARCH=$(uname -m)
echo "HOST_ARCH: $HOST_ARCH."

if [ ! -f "$CRAFT_PART_BUILD/flutter-3.24.4-$HOST_ARCH.tar.xz" ]; then
   echo "🟩 Downloading Flutter"
   wget "https://github.com/containerbase/flutter-prebuild/releases/download/3.24.4/flutter-3.24.4-$HOST_ARCH.tar.xz" -P "$CRAFT_PART_BUILD"
fi

if [ -d "$PG_FLUTTER_BUILD_DIR" ]; then
   echo "🟩 Removing flutter directory"
   rm -rf "$PG_FLUTTER_BUILD_DIR"
fi

echo "🟩 Unzipping"
mkdir -p "$PG_FLUTTER_BUILD_DIR" && tar -xf "$CRAFT_PART_BUILD/flutter-3.24.4-$HOST_ARCH.tar.xz" -C "$PG_FLUTTER_BUILD_DIR" --strip-components 1

echo "🟩 Config $PG_FLUTTER_BUILD_DIR"
git config --global --add safe.directory "$PG_FLUTTER_BUILD_DIR"

echo "🟩 Running ls"
ls

exit 0
