#!/bin/bash
# SPDX-License-Identifier: CC0-1.0
# SPDX-FileCopyrightText: 2025 Add ZH-HanT-Taiwan Support Open Culture Foundation Ian, 2025 Standard for Public Code Authors, https://www.standardforpubliccode.org/AUTHORS; 2022-2024 The Foundation for Public Code <info@publiccode.net>, https://www.standardforpubliccode.org/AUTHORS

# halt on error
set -e

# On Ubuntu (and Debian-like systems), fc-cache is in the fontconfig package
# sudo apt-get install -y fontconfig

FONT_DIR="${HOME}/.local/share/fonts"
mkdir -pv "$FONT_DIR"

install_font() {
  local FONT_NAME="$1"
  local FONT_URL="$2"
  local OUTFILE="$3"
  
# skip if font is already installed  
if fc-match "$FONT_NAME" >/dev/null 2>&1; then
    echo "$FONT_NAME is installed"
    return
  fi

  echo "Installing $FONT_NAME from $FONT_URL"
  cd "$FONT_DIR"
  curl --location --silent --output "$OUTFILE" "$FONT_URL"
}

# install Mulish — original Latin font
install_font "Mulish" \
  "https://github.com/google/fonts/raw/refs/heads/main/ofl/mulish/Mulish%5Bwght%5D.ttf" \
  "Mulish.ttf"

# install Noto Sans TC — Traditional Chinese font
install_font "Noto Sans TC" \
  "https://github.com/notofonts/noto-cjk/raw/main/Sans/OTF/TraditionalChinese/NotoSansTC-Regular.otf" \
  "NotoSansTC-Regular.otf"
  
echo "Refreshing font cache…"
fc-cache -fv >/dev/null 2>&1

echo "Done installing fonts. Available fonts list:"
fc-list | grep -E "Mulish|Noto Sans TC"