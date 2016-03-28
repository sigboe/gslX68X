# gslX68X
Kernel space driver for Silead touch screen digitizers. Forked from Robert Dolca's driver originally posted to [lkml](https://lkml.org/lkml/2015/8/25/738).

## Compilation
First you should get your kernel headers and build dependencies. Assuming debian based operating systems like Ubuntu
```
sudo apt-get install kernel-headers-$(uname -r)
sudo apt-get build-dep linux-image-$(uname -r)
```
Then you can simply fetch this repository and compile it using
```
sudo apt-get install -y git
git clone https://github.com/sigboe/gslX68X.git && cd gslX68X
make
```

## Firmware
You will need to place a firmware file at `/lib/firmware/[hid].fw` where you replace [hid] with the lower case hardware ID of your device.
In most cases, this is `mssl1680` or the exact part name such as `gsl1680`, `gsl1688`, `gsl3670`, `gsl3675` or `gsl3692`.

If `mssl1680.fw` does not work, watch the `dmesg` output for a message similar to this one:
```
[    5.124400] silead_ts i2c-MSSL1680:00: Direct firmware load for mssl1680.fw failed with error -2
```
This inidicates that the firmware should be named `mssl1680.fw`.

Firmware for some devices can be obtained from [gsl-firmware](https://github.com/onitake/gsl-firmware).
You can also find conversion tools there to create your own firmware image from Windows or Android drivers.
Note that `silead.ko` requires firmware in 'plain' format.

## Using the driver
You can start using the driver by `sudo insmod silead.ko` in the working directory where you compiled the driver.

In most cases, some calibration is required before the driver produces accurate results.
Use [xinput_calibrator](https://www.freedesktop.org/wiki/Software/xinput_calibrator/) for this purpose.

## Installation
To install the driver permanently, type `sudo make install`. This will copy the `silead.ko` to `/lib/modules/<kernel version>/kernel/drivers/input/touchscreen`. You may have to run `sudo update-initramfs -k all -u` or similar afterwards to update the initial ramdisk.