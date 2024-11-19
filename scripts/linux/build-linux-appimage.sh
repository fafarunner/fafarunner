#!/bin/zsh

set -e

# 检查依赖
check_dependency() {
    if ! command -v "$1" &> /dev/null; then
        echo "Error: $1 is not installed. Install it and try again."
        exit 1
    fi
}

# 检查必要工具
check_dependency "wget"
check_dependency "chmod"
check_dependency "uname"

# 检测系统架构
detect_arch() {
    local arch
    arch=$(uname -m)
    case "$arch" in
        x86_64)
            echo "x86_64"
            ;;
        aarch64)
            echo "aarch64"
            ;;
        *)
            echo "Unsupported architecture: $arch"
            exit 1
            ;;
    esac
}

# 设置变量
APP_NAME="FaFa Runner"            # 应用名称
APP_VERSION="1.0.3.367"         # 应用版本
APP_EXECUTABLE="fafarunner"      # 可执行文件名称（架构敏感）
APP_DIR="./AppDir"          # AppDir 目录
DESKTOP_FILE="./linux/shared/$APP_EXECUTABLE.desktop" # .desktop 文件路径
ICON_SOURCE_DIR="./logo"     # 应用图标路径

# 定义 AppImage 工具的 URL
APP_IMAGE_TOOL_URL_X86_64="https://github.com/AppImage/AppImageKit/releases/download/continuous/appimagetool-x86_64.AppImage"
APP_IMAGE_TOOL_URL_AARCH64="https://github.com/AppImage/AppImageKit/releases/download/continuous/appimagetool-aarch64.AppImage"

# 准备 AppDir 目录
prepare_appdir() {
  echo "🟩 Preparing AppDir..."

  # 复制可执行文件
  mkdir -p "$APP_DIR/usr/bin"
  cp "${APP_EXECUTABLE}_${ARCH}" "$APP_DIR/usr/bin/$APP_EXECUTABLE"

  # 复制 .desktop 文件
  DESKTOP_TARGET_DIR="$APP_DIR/usr/share/applications"
  mkdir -p "$DESKTOP_TARGET_DIR"
  cp "$DESKTOP_FILE" "$DESKTOP_TARGET_DIR/"
  desktop-file-edit --set-name="$APP_NAME" --copy-name-to-generic-name --set-icon="$APP_EXECUTABLE" "$DESKTOP_TARGET_DIR/$APP_EXECUTABLE.desktop"

  # 复制图标
  for s in 32 128 256 512; do
      ICON_TARGET_DIR="$APP_DIR/share/icons/hicolor/${s}x${s}/apps"
      mkdir -p "$ICON_TARGET_DIR"
      cp "$ICON_SOURCE_DIR/logo-${s}.png" "$ICON_TARGET_DIR/$APP_EXECUTABLE.png"
  done

  echo "🟩 AppDir is ready."
}

# 下载 appimagetool 工具
download_appimagetool() {
    local arch="$1"
    local url="$2"
    local output_file="appimagetool"

    echo "🟩 Downloading appimagetool for $arch..."
    wget -c "$url" -O "$output_file"
    chmod +x "$output_file" && mv "$output_file" /usr/local/bin/
    echo "🟩 appimagetool for $arch is ready."
}

# 创建 AppImage
create_appimage() {
    local output_file="${APP_NAME}-${APP_VERSION}-${ARCH}.AppImage"
    echo "🟩 Creating AppImage for $ARCH..."
    appimagetool "$APP_DIR" "$output_file"
    echo "🟩 AppImage created successfully: $output_file"
}

# 主流程
main() {
    # 检测系统架构
    ARCH=$(detect_arch)

    # 设置工具 URL
    if [ "$ARCH" == "x86_64" ]; then
        APP_IMAGE_TOOL_URL="$APP_IMAGE_TOOL_URL_X86_64"
    elif [ "$ARCH" == "aarch64" ]; then
        APP_IMAGE_TOOL_URL="$APP_IMAGE_TOOL_URL_AARCH64"
    fi

    # 准备 AppDir 目录
    prepare_appdir

    # 下载 appimagetool 工具（如果不存在）
    if ! command -v appimagetool >/dev/null 2>&1; then
       download_appimagetool "$ARCH" "$APP_IMAGE_TOOL_URL"
    fi

    # 创建 AppImage
    create_appimage
}

# 运行主流程
main

exit 0
