BASE ?= $(shell dirname $(MAKEFILE_LIST))
VPATH = $(BASE) $(BASE)/src
CFILES = stlink-common.c stlink-flash.c stlink-usb.c uglylogging.c gdb-remote.c gdb-server.c
HEADERS = stlink-common.h stlink-flash.h stlink-usb.h uglylogging.h gdb-remote.h
CFLAGS = -std=gnu99 -Wall -Wextra -Werror -O2
LDFLAGS = -lusb-1.0

st-util: $(CFILES) | $(HEADERS) Makefile
	gcc $(LIBUSB_CFLAGS) $(LIBUSB_LDFLAGS) $^ $(CFLAGS) -o $@ $(LDFLAGS) $(OS_LDFLAGS)

clean:
	rm st-util
