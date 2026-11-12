#!/bin/sh
set -eu
cd -- "$(dirname -- "$0")"
if [ ! -x ./cmatrix-jp ]; then
    make
fi
exec ./cmatrix-jp -a -b -c -u 10 -C magenta "$@"
