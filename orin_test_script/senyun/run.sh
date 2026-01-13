sudo chmod +x ./*.sh

sudo ./poc_reset.sh

sleep 0.1

sudo ./config_base_on_j5.sh

sleep 0.1

sudo insmod ./nv_isx031.ko
sudo dmesg | tail -20