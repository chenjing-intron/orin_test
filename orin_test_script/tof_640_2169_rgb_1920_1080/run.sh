#sleep 0.5
./poc_reset.sh
sleep 2
./set-60-80.sh
sleep 0.2
insmod ./nv_irs2877a.ko
insmod ./nv_sz220at.ko
#insmod nvmap.ko
#insmod nvgpu.ko
#sleep 0.2


#sleep 0.1

echo 1 > /sys/kernel/debug/bpmp/debug/clk/vi/mrq_rate_locked
echo 1 > /sys/kernel/debug/bpmp/debug/clk/isp/mrq_rate_locked
echo 1 > /sys/kernel/debug/bpmp/debug/clk/nvcsi/mrq_rate_locked
echo 1 > /sys/kernel/debug/bpmp/debug/clk/emc/mrq_rate_locked
cat /sys/kernel/debug/bpmp/debug/clk/vi/max_rate |tee /sys/kernel/debug/bpmp/debug/clk/vi/rate
cat /sys/kernel/debug/bpmp/debug/clk/isp/max_rate | tee  /sys/kernel/debug/bpmp/debug/clk/isp/rate
cat /sys/kernel/debug/bpmp/debug/clk/nvcsi/max_rate | tee /sys/kernel/debug/bpmp/debug/clk/nvcsi/rate
cat /sys/kernel/debug/bpmp/debug/clk/emc/max_rate | tee /sys/kernel/debug/bpmp/debug/clk/emc/rate

v4l2-ctl -d /dev/video0 --set-fmt-video=width=640,height=2169,pixelformat=RG12 --stream-to=./rg12.raw --stream-count=100000 --stream-mmap --verbose

