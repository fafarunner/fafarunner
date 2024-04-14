#!/bin/zsh

set -e

git_commit=$(git rev-parse --short=8 HEAD)
if [ -f "macos/Flutter/BuildConfig.xcconfig" ]; then
    echo "Delete macos/Flutter/BuildConfig.xcconfig"
    rm -f macos/Flutter/BuildConfig.xcconfig
fi

echo "Create macos/Flutter/BuildConfig.xcconfig"
echo "FLUTTER_BUILD_NAME_SUFFIX=+$git_commit" >> macos/Flutter/BuildConfig.xcconfig

exit 0
