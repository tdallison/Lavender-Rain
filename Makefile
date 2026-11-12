CC ?= gcc
CFLAGS ?= -O2 -Wall -Wextra
CPPFLAGS += -D_XOPEN_SOURCE_EXTENDED
LDLIBS += -lncursesw

.PHONY: all clean
all: cmatrix-jp

cmatrix-jp: cmatrix.c config.h
	$(CC) $(CPPFLAGS) $(CFLAGS) -o $@ cmatrix.c $(LDFLAGS) $(LDLIBS)

clean:
	rm -f cmatrix-jp
