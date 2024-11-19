#!/bin/zsh

set -e

for s in 32 128 256 512; do
    ICON_TARGET_DIR="$APP_DIR/share/icons/hicolor/${s}x${s}/apps"
    echo "$ICON_TARGET_DIR"
    echo "./logo/logo-${s}.png"
done

exit 0
