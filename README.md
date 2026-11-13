# Lavender Rain 🟣

Slow, soft Matrix-inspired rain for your terminal, in Digital Lavender (`#C4A7E7`). Lavender Rain is a customized, ncurses-based CMatrix derivative with half-width katakana, occasional hexadecimal characters, bright stream heads, and a little sideways glitch.

## Build and run

On Ubuntu, install a C compiler, Make, and the wide-character ncurses development library:

```sh
sudo apt install build-essential libncurses-dev fonts-noto-cjk
make
./run_matrix.sh
```

The launcher builds the executable if necessary and runs it with `-a -b -c -u 10 -C magenta`. Pass additional options to override settings, for example `./run_matrix.sh -u 8`. Press `q` to quit or `p` to pause. Number keys adjust the delay while running.

The program works in a UTF-8 locale and needs a font with half-width katakana. On Ubuntu, `fonts-noto-cjk` provides **Noto Sans Mono CJK JP**, the font used for this project. Install the packages above or run `./install_dependencies.sh` on Ubuntu. To use that font in Ghostty, add this to your Ghostty configuration and reload it:

```ini
font-family = Noto Sans Mono CJK JP
```

Check the installed font with `fc-match 'Noto Sans Mono CJK JP'`. Lavender Rain was developed with Ghostty on Ubuntu Wayland; Ghostty's terminfo must be installed for `TERM=xterm-ghostty`. Terminals that cannot redefine palette colors use their standard magenta instead. The font is installed by Ubuntu's package manager; its files are not bundled in this repository.

## The rain

- 85% half-width katakana, 13% hexadecimal, and 2% symbols (`+-*/=:<>|`). Digits are weighted slightly more heavily than hexadecimal letters.
- Bright white stream heads, lavender trails, asynchronous scrolling, and occasional one-cell sideways glitches.
- The `-u` delay uses 15 ms steps: `-u 10` waits 150 ms per frame. Asynchronous columns can update less often.
- `-c` and `-m` remain compatibility options; the mixed palette is always active.

You can also build directly:

```sh
gcc -O2 -Wall -Wextra -D_XOPEN_SOURCE_EXTENDED -o cmatrix-jp cmatrix.c -lncursesw
```

Use `make clean` to remove the local executable. Building does not modify an installed CMatrix.

## License and attribution

Lavender Rain is derived from [CMatrix](https://github.com/abishekvashok/cmatrix). It retains the original copyright notices and is distributed under the GNU General Public License, version 3 or later. See [COPYING](COPYING).
