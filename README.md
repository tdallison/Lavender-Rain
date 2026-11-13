# Lavender Rain 🟣

Slow, soft Matrix-inspired rain for your terminal, in Digital Lavender (`#C4A7E7`). Lavender Rain is a customized, ncurses-based CMatrix derivative with half-width katakana, occasional hexadecimal characters, bright stream heads, and a little sideways glitch.

## Lightweight quickstart

On 64-bit x86 Linux, this downloads only the `cmatrix-jp` binary, saves it under `./lavender-rain/`, and starts the usual lavender rain:

```sh
curl -fsSL https://raw.githubusercontent.com/tdallison/Lavender-Rain/main/quickstart.sh | sh
```

Pass alternate CMatrix options after the script by downloading it first:

```sh
curl -fLO https://raw.githubusercontent.com/tdallison/Lavender-Rain/main/quickstart.sh
chmod +x quickstart.sh
./quickstart.sh -u 8
```

## Lightweight binary-only option

On 64-bit x86 Linux, you can download just the executable instead of cloning the source and bundled font collection:

```sh
mkdir -p lavender-rain && cd lavender-rain
curl -fL -o cmatrix-jp https://raw.githubusercontent.com/tdallison/Lavender-Rain/main/cmatrix-jp
chmod +x cmatrix-jp
./cmatrix-jp -a -b -c -u 10 -C magenta
```

The executable also needs the ncurses runtime libraries and a compatible C library (glibc 2.38 or newer). On Ubuntu, install `libncursesw6` and `libtinfo6` if they are missing. For the recommended font, run:

```sh
sudo apt install fonts-noto-cjk
```

If Noto Sans Mono CJK JP is already installed, there is no need to install it again; another terminal font that supports half-width katakana can also work. A UTF-8 locale and the terminal's terminfo entry are required as well. If your system cannot run the included binary, build from source instead.

## Build and run from source

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

Check the installed font with `fc-match 'Noto Sans Mono CJK JP'`. A copy of the font collection is also included in `fonts/`; to install it for your user without the Ubuntu font package, copy it to `~/.local/share/fonts/` and run `fc-cache -f`. Its licensing information is in `fonts/LICENSE.txt`.

Lavender Rain was developed with Ghostty on Ubuntu Wayland; Ghostty's terminfo must be installed for `TERM=xterm-ghostty`. Terminals that cannot redefine palette colors use their standard magenta instead. The included `cmatrix-jp` binary was built for 64-bit x86 Linux and dynamically links to ncurses; run `make` to rebuild for your own system.

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
