# gslX68X
Kernel space driver for Silead touch screen digitizers. Forked from Robert Dolca's dirver originally posted to [lkml](https://lkml.org/lkml/2015/8/25/738). 

## Compilation
Assuming debian based operating systems like Ubuntu
```
sudo apt-get install -y git
git clone https://github.com/sigboe/gslX68X.git && cd gslX68X
make
```
You will need to place a firmware file at `/lib/firmware/[hid].fw` where you replace [hid] with the HID ID of your device.

## Using the driver
You can start using the driver by `insmod silead.ko` in the working directory where you compiled the driver. 

## Installation
Installation instructions will be added later.
