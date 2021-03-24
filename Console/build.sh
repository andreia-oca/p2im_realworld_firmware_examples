#!/bin/bash

git clone -b 2018.04 --depth 1 https://github.com/RIOT-OS/RIOT.git
cd RIOT
git apply ../patch

make WERROR=0 -C examples/default
cp examples/default/bin/frdm-k64f/default.elf ../console.elf
 