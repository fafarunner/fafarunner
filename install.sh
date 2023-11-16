#!/bin/sh

if cd flutter; then
  git pull && git checkout 3.13.9 && cd .. ;
else
  echo "🟩 Install Flutter"
  git clone https://github.com/flutter/flutter.git -b stable
  git checkout 3.13.9 ;
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
