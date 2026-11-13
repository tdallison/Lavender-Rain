#!/bin/sh
# Install the compiler, ncurses headers, and the recommended Japanese font on Ubuntu.
set -eu
sudo apt install build-essential libncurses-dev fonts-noto-cjk
