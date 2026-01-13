#!/bin/bash

set -x

export CROSS_COMPILE_AARCH64_PATH=/home/user/Daniel/R35.1/bootlin-gcc-9.3
export CROSS_COMPILE_AARCH64=/home/user/Daniel/R35.1/bootlin-gcc-9.3/bin/aarch64-buildroot-linux-gnu-

/home/user/Daniel/orin_test/Linux_for_Tegra/source/public/nvbuild.sh -o /home/user/Daniel/orin_test/Linux_for_Tegra/source/src_out