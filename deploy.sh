#!/bin/bash

set -x

# Set password (WARNING: Storing passwords in scripts is insecure!)
PASSWORD="root"

cp /home/user/Daniel/orin_test/Linux_for_Tegra/source/src_out/arch/arm64/boot/dts/nvidia/tegra234-p3701-0004-p3737-0000.dtb /home/user/Daniel/orin_test/senyun
mv -f /home/user/Daniel/orin_test/senyun/tegra234-p3701-0004-p3737-0000.dtb /home/user/Daniel/orin_test/senyun/tegra234-p3701-0004-p3737-0000-senyun.dtb

scp /home/user/Daniel/orin_test/senyun/tegra234-p3701-0004-p3737-0000-senyun.dtb wzj@192.168.1.110:/boot/dtb

cp /home/user/Daniel/orin_test/Linux_for_Tegra/source/src_out/drivers/media/i2c/nv_isx031.ko /home/user/Daniel/orin_test/senyun

scp -r /home/user/Daniel/orin_test/senyun/ wzj@192.168.1.110:/home/wzj