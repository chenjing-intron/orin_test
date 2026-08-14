#sleep 0.5
#./poc_reset.sh
sleep 2
./set-60-80_pipe12.sh
sleep 0.2
insmod ./nv_irs2877a2.ko
insmod ./nv_sz220at2.ko
#insmod nvmap.ko
#insmod nvgpu.ko
#sleep 0.2


#sleep 0.1

#v4l2-ctl -d /dev/video0 --set-fmt-video=width=640,height=2169,pixelformat=RG12 --stream-to=./rg12.raw --stream-count=100000 --stream-mmap --verbose

