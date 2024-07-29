
get:
	echo "╠ Installing dependencies..."
	fvm flutter pub get

outdated:
	echo "╠ Resolving dependencies..."
	fvm flutter pub outdated

sorter:
	echo "╠ Sorting imports..."
	fvm dart run import_sorter:main lib\/* test\/*

clean: ## Cleans the environment
	echo "╠ Cleaning the project..."
	fvm flutter clean
	echo "╠ Installing dependencies..."
	make get

install:
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
	fvm dart run build_runner watch --delete-conflicting-outputs

build_runner: ## Build the files for changes
	echo "╠ Building the project..."
	fvm dart run build_runner build --delete-conflicting-outputs

apk: ## Release Apk
	echo "╠ Releasing Apk..."
	fvm flutter build apk --no-tree-shake-icons --dart-define-from-file=".env.$(ENV).local" --flavor staging

appbundle: ## Release Appbundle
	echo "╠ Releasing Appbundle..."
	fvm flutter build appbundle --no-tree-shake-icons --dart-define-from-file=".env.$(ENV).local" --flavor production

adhoc:
	echo "╠ Removing build products and intermediate files from the build root..."
	cd ios && xcodebuild clean && cd ..
	echo "╠ Releasing to adhoc..."
	fvm flutter build ipa --dart-define-from-file=".env.$(ENV).local" --export-options-plist=ios/ExportOptions-debug.plist

appstore:
	echo "╠ Removing build products and intermediate files from the build root..."
	cd ios && xcodebuild clean && cd ..
	echo "╠ Releasing to app store..."
	fvm flutter build ipa --dart-define-from-file=".env.$(ENV).local" --export-options-plist=ios/ExportOptions-release.plist

macos_adhoc:
	echo "╠ Removing build products and intermediate files from the build root..."
	cd macos && xcodebuild clean && cd ..
	echo "╠ Releasing bundle..."
	fvm flutter build macos --dart-define-from-file=".env.$(ENV).local"

macos_appstore:
	echo "╠ Removing build products and intermediate files from the build root..."
	cd macos && xcodebuild clean && cd ..
	echo "╠ Releasing bundle..."
	fvm flutter build macos --dart-define-from-file=".env.$(ENV).local"
