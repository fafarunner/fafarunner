
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

build_watch: ## Watches the files for changes
	echo "╠ Watching the project..."
	flutter pub run build_runner watch --delete-conflicting-outputs

build_runner: ## Build the files for changes
	echo "╠ Building the project..."
	flutter pub run build_runner build --delete-conflicting-outputs

apk: ## Release Apk
	echo "╠ Releasing Apk..."
	flutter build apk --no-tree-shake-icons --target lib/main.dart

appbundle: ## Release Appbundle
	echo "╠ Releasing Appbundle..."
	flutter build appbundle --no-tree-shake-icons --target lib/main.dart
