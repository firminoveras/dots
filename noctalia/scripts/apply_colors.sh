#!/usr/bin/env bash
WALLPAPER="${1:-$NOCTALIA_WALLPAPER_PATH}"
PALETTE_FILE="$HOME/.config/noctalia/palettes/focus.json"
if [ -n "$WALLPAPER" ] && [ -f "$WALLPAPER" ]; then
    matugen image "$WALLPAPER" -t scheme-content -m dark --source-color-index 0
    FIRST_PIXEL="#$(magick "$WALLPAPER"[1x1+0+0] -format "%[hex:p{0,0}]" info: | cut -c 1-6)"
    jq --arg surf "$FIRST_PIXEL" '.dark.mSurface = $surf | .dark.terminal.background = $surf' "$PALETTE_FILE" > "$PALETTE_FILE.tmp" && mv "$PALETTE_FILE.tmp" "$PALETTE_FILE"
    noctalia msg config-reload
fi
