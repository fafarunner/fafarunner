#!/bin/sh

if cd flutter; then
  git pull && cd .. ;
else
  echo "🟩 Install Flutter"
  git clone https://github.com/flutter/flutter.git -b stable
fi

echo "🟩 Running ls"
ls

echo "🟩 Running flutter doctor -v"
flutter/bin/flutter doctor -v

echo "🟩 Cleaning the project..."
flutter/bin/flutter clean

echo "🟩 Install Flutter Dependencies"
flutter/bin/flutter pub get

exit 0
