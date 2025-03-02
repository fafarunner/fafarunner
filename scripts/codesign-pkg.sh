#!/bin/zsh

set -e

# https://gist.github.com/GuillaumeFalourd/4efc73f1a6014b791c0ef223a023520a
DEVELOPER_ID_APP=$1

# Make sure the parameters are provided
if [ -z "$DEVELOPER_ID_APP" ]; then
  echo "Usage: $0 <DEVELOPER_ID_APP>"
  exit 1
fi

TARGET_DIR="build/macos/Build/Products/Release/FaFa Runner.app"
BUNDLE_ID="com.chenyifaer.fafarunner"

# Check whether the target directory exists
if [ ! -d "$TARGET_DIR" ]; then
  echo "Error: Directory '$TARGET_DIR' does not exist!"
  exit 1
fi

echo "Signing files in $TARGET_DIR..."

# Enter the target directory (terminate if it fails)
cd "$TARGET_DIR" || { echo "Failed to enter directory $TARGET_DIR"; exit 1; }

# Sign only files to avoid signing directories
find . -type f | while read -r file; do
  echo "Signing: $file"
  /usr/bin/codesign --deep -s "$DEVELOPER_ID_APP" -f --timestamp -i "$BUNDLE_ID" -o runtime "$file"
done

echo "Signing completed successfully!"

exit 0
