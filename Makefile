
get:
	echo "╠ Installing dependencies..."
	fvm flutter pub get

outdated:
	echo "╠ Resolving dependencies..."
	fvm flutter pub outdated

husky_pre:
	echo "╠ Prepare the husky environment..."
	fvm dart run husky install

format:
	echo "╠ Sorting imports..."
	fvm dart run import_sorter:main lib\/* test\/*

asset: ##
	echo "╠ Generating assets..."
	cd modules/basic/assets ; fvm dart run build_runner build --delete-conflicting-outputs ; cd -

l10n: ##
	echo "╠ Generating i18n files..."
	cd modules/basic/l10n ; fvm dart run build_runner build --delete-conflicting-outputs ; cd -

game: ##
	echo "╠ Generating i18n files..."
	cd modules/ui/game ; fvm dart run build_runner build --delete-conflicting-outputs ; cd -

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

precache: ## Installing ios dependencies
	echo "╠ Populate the Flutter tool's cache of binary artifacts..."
	fvm flutter precache -a

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
	fvm flutter build ipa --dart-define-from-file=".env.$(ENV).local" --export-options-plist=ios/ExportOptions/debug.plist

appstore:
	echo "╠ Removing build products and intermediate files from the build root..."
	cd ios && xcodebuild clean && cd ..
	echo "╠ Releasing to app store..."
	fvm flutter build ipa --dart-define-from-file=".env.$(ENV).local" --export-options-plist=ios/ExportOptions/release.plist

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

web_prod:
	echo "╠ Releasing web..."
	fvm flutter build web --dart-define-from-file=".env.$(ENV).local"

web_dev:
	echo "╠ Releasing web..."
	fvm flutter run -d web-server --web-hostname 0.0.0.0 --web-port 8080 --dart-define-from-file=".env.$(ENV).local"
