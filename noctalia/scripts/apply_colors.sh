#!/usr/bin/env bash
# ~/.config/noctalia/scripts/apply_colors.sh "$NOCTALIA_WALLPAPER_PATH"

noctalia msg panel-close wallpaper

RAW_WALLPAPER="${1:-$NOCTALIA_WALLPAPER_PATH}"
WALLPAPER="${RAW_WALLPAPER/#\~/$HOME}"
PALETTE_FILE="$HOME/.config/noctalia/palettes/focus.json"

TOP_COLORS=($(magick "$WALLPAPER" -scale 100x100\! -colors 16 -format %c histogram:info: | sort -nr | grep -oE '#[0-9A-Fa-f]{6}' | head -n 2 | tr 'a-f' 'A-F'))

COLOR_SURFACE="${TOP_COLORS[0]}"
COLOR_BASE="${TOP_COLORS[1]}"

TMP_SCHEME_FILE=$(mktemp)
kitty --class "floating-fzf" -e sh -c '
    printf "%s\n" \
        "scheme-fidelity" \
        "scheme-content" \
        "scheme-vibrant" \
        "scheme-expressive" \
        "scheme-rainbow" \
        "scheme-tonal-spot" \
        "scheme-neutral" \
        "scheme-monochrome" | fzf --prompt="Escolha o Scheme > " --height=100% --layout=reverse --border > "'"$TMP_SCHEME_FILE"'"
'
SCHEME=$(cat "$TMP_SCHEME_FILE")
rm -f "$TMP_SCHEME_FILE"
if [ -z "$SCHEME" ]; then
    exit 0
fi

THEME_MODE="dark"
LUMINANCE=0

if [ -n "$COLOR_SURFACE" ]; then
    HEX_CLEAN="${COLOR_SURFACE#\#}"
    R=$((16#${HEX_CLEAN:0:2}))
    G=$((16#${HEX_CLEAN:2:2}))
    B=$((16#${HEX_CLEAN:4:2}))

    LUMINANCE=$(( (R * 299 + G * 587 + B * 114) / 1000 ))
    notify-send "Luminance" "$LUMINANCE" -t 3000

    if [ "$LUMINANCE" -lt 128 ]; then
        THEME_MODE="dark"
    else
        THEME_MODE="light"
    fi
fi

matugen color hex "$COLOR_BASE" -t "$SCHEME" -m "$THEME_MODE"

if [ -n "$COLOR_SURFACE" ]; then
    THRESHOLD=80
    if [ "$LUMINANCE" -lt "$THRESHOLD" ]; then
        jq --arg surf "$COLOR_SURFACE" --arg mode "$THEME_MODE" '.[$mode].mSurface = $surf | .[$mode].terminal.background = $surf' "$PALETTE_FILE" > "$PALETTE_FILE.tmp" && mv "$PALETTE_FILE.tmp" "$PALETTE_FILE"
    fi
fi

noctalia msg theme-mode-set "$THEME_MODE"
noctalia msg config-reload
