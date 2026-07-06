#!/usr/bin/env bash

TEMPLATE_DIR="$HOME/.config/noctalia/templates/android-studio"
BUILD_DIR="/tmp/studio-noctalia-theme"
JAR_NAME="matugen-theme.jar"

mkdir -p "$BUILD_DIR/META-INF"

cp "$TEMPLATE_DIR/plugin.xml" "$BUILD_DIR/META-INF/plugin.xml"

cd "$BUILD_DIR" || exit 1

zip -r "$JAR_NAME" META-INF/ matugen.theme.json matugen.xml > /dev/null

AS_BASE_DIR=$(ls -d "$HOME"/.local/share/Google/AndroidStudio* "$HOME"/.config/Google/AndroidStudio* 2>/dev/null | sort -V | tail -n 1)

if [ -n "$AS_BASE_DIR" ]; then
    [ -d "$AS_BASE_DIR/plugins" ] && rm -rf "$AS_BASE_DIR/plugins"
    
    cp "$JAR_NAME" "$AS_BASE_DIR/"
    echo "Sucesso! Plugin compilado em $BUILD_DIR e injetado em: $AS_BASE_DIR"
else
    echo "Erro: Nenhuma pasta base do Android Studio foi encontrada."
fi

rm -rf "$BUILD_DIR"
