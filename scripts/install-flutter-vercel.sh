#!/bin/sh

set -e

if ! command -v wget >/dev/null 2>&1; then
   echo "🟩 Installing wget"
   yum install wget xz -y
fi

if [ ! -f "flutter_linux_3.24.2-stable.tar.xz" ]; then
   echo "🟩 Downloading Flutter"
   wget https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.24.2-stable.tar.xz
fi

if [ -d "flutter" ]; then
   echo "🟩 Removing flutter directory"
   rm -rf flutter;
fi

echo "🟩 Unzipping"
mkdir flutter && tar -xf flutter_linux_3.24.2-stable.tar.xz -C flutter --strip-components 1

echo "🟩 Config $PWD/flutter"
git config --global --add safe.directory "$PWD/flutter"

echo "🟩 Running ls"
ls

echo "🟩 Running flutter doctor -v"
flutter/bin/flutter doctor -v

echo "🟩 Cleaning the project..."
flutter/bin/flutter clean

echo "🟩 Install Flutter Dependencies"
flutter/bin/flutter pub get

exit 0
