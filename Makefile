SHELL := /bin/bash
KVER ?= $(shell uname -r)
KSRC := /lib/modules/$(KVER)/build
PWD := $(shell pwd)

obj-m := pps-gpio-poll.o

.PHONY: all install uninstall modules_install clean

all:
	$(MAKE) -C $(KSRC) M=$(PWD) modules

install: all
	make -C $(KSRC) M=$(PWD) modules_install

uninstall:
	make -C $(KSRC) M=$(PWD) modules_uninstall

modules_install:
	$(MAKE) -C $(KSRC) M=$(PWD) modules_install

clean:
	make -C $(KSRC) M=$(PWD) clean
