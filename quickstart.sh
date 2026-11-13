#!/bin/sh
# Download and run Lavender Rain without cloning the full repository.
set -eu

target_dir="${LAVENDER_RAIN_DIR:-lavender-rain}"
binary_url="https://raw.githubusercontent.com/tdallison/Lavender-Rain/main/cmatrix-jp"

mkdir -p "$target_dir"
cd "$target_dir"

if [ ! -x ./cmatrix-jp ]; then
    curl -fL -o cmatrix-jp "$binary_url"
    chmod +x cmatrix-jp
fi

exec ./cmatrix-jp -a -b -c -u 10 -C magenta "$@"
