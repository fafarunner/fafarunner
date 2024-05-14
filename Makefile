
get:
	echo "╠ Installing dependencies..."
	flutter pub get

outdated:
	echo "╠ Resolving dependencies..."
	flutter pub outdated

clean: ## Cleans the environment
	echo "╠ Cleaning the project..."
	flutter clean
	echo "╠ Installing dependencies..."
	flutter pub get

install:
	make npm_install
	make ios_install
	make macos_install

dev:
	echo "╠ Start app..."
	cd docs && pnpm dev && cd ..

npm_install:
	echo "╠ Resolving npm dependencies..."
	cd docs && pnpm i && cd ..

pub_install:
	make ios_install
	make macos_install

ios_install: ## Installing ios dependencies
	echo "╠ Resolving ios dependencies..."
	cd ios && pod install && cd ..

macos_install: ## Installing ios dependencies
	echo "╠ Resolving macos dependencies..."
	cd macos && pod install && cd ..

build_watch: ## Watches the files for changes
	echo "╠ Watching the project..."
	flutter pub run build_runner watch --delete-conflicting-outputs

build_runner: ## Build the files for changes
	echo "╠ Building the project..."
	flutter pub run build_runner build --delete-conflicting-outputs

apk: ## Release Apk
	echo "╠ Releasing Apk..."
	bash build-android.sh && flutter build apk --no-tree-shake-icons --target lib/main.dart --flavor staging

appbundle: ## Release Appbundle
	echo "╠ Releasing Appbundle..."
	flutter build appbundle --no-tree-shake-icons --target lib/main.dart --flavor production

adhoc:
	echo "╠ Removing build products and intermediate files from the build root..."
	cd ios && xcodebuild clean && cd ..
	echo "╠ Releasing to adhoc..."
	bash build-ios.sh && flutter build ipa --export-options-plist=ios/ExportOptions-debug.plist

appstore:
	echo "╠ Removing build products and intermediate files from the build root..."
	cd ios && xcodebuild clean && cd ..
	echo "╠ Removing BuildConfig.xcconfig..."
	rm -f ios/Flutter/BuildConfig.xcconfig
	echo "╠ Releasing to app store..."
	flutter build ipa --export-options-plist=ios/ExportOptions-release.plist
