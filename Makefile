MODULE_NAME = silead

#CROSS_COMPILE ?= arm-linux-gnueabihf-
#ARCH ?= arm
ARCH := $(shell uname -m | sed -e s/i.86/i386/)
KVER := $(shell uname -r)
KSRC := /lib/modules/$(KVER)/build
PWD = $(shell pwd)
MODDESTDIR := /lib/modules/$(KVER)/kernel/drivers/input/touchscreen

obj-m += silead.o

.PHONY: all modules clean

all: modules

modules:
	make -C $(KSRC) ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) M=$(PWD) modules

install:
	install -p -m 644 $(MODULE_NAME).ko  $(MODDESTDIR)
	/sbin/depmod -a $(KVER)

uninstall:
	rm -f $(MODDESTDIR)/$(MODULE_NAME).ko
	/sbin/depmod -a $(KVER)

clean:
	make -C $(KSRC) ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE) M=$(PWD) clean
