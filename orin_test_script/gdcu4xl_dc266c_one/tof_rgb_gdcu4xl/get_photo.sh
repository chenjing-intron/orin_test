echo 1 > /sys/kernel/debug/bpmp/debug/clk/vi/mrq_rate_locked
echo 1 > /sys/kernel/debug/bpmp/debug/clk/isp/mrq_rate_locked
echo 1 > /sys/kernel/debug/bpmp/debug/clk/nvcsi/mrq_rate_locked
echo 1 > /sys/kernel/debug/bpmp/debug/clk/emc/mrq_rate_locked

echo 214300000 > /sys/kernel/debug/bpmp/debug/clk/nvcsi/rate

cat /sys/kernel/debug/bpmp/debug/clk/vi/max_rate |tee /sys/kernel/debug/bpmp/debug/clk/vi/rate
cat /sys/kernel/debug/bpmp/debug/clk/isp/max_rate | tee  /sys/kernel/debug/bpmp/debug/clk/isp/rate
cat /sys/kernel/debug/bpmp/debug/clk/nvcsi/max_rate | tee /sys/kernel/debug/bpmp/debug/clk/nvcsi/rate
cat /sys/kernel/debug/bpmp/debug/clk/emc/max_rate | tee /sys/kernel/debug/bpmp/debug/clk/emc/rate

echo "Starting capture test..."
timeout 10 v4l2-ctl -d /dev/video0 --set-fmt-video=width=640,height=2169,pixelformat=RG12 --stream-to=/tmp/frame1.raw --stream-count=50 --stream-mmap --verbose
timeout 10 v4l2-ctl -d /dev/video1 --set-fmt-video=width=1920,height=1080,pixelformat=UYVY --stream-mmap --stream-count=50 --stream-to=/tmp/frame2.raw --verbose

echo ""
echo "Capture result:"
ls -lh /tmp/frame1.raw 2>/dev/null || echo "No frame captured"
ls -lh /tmp/frame2.raw 2>/dev/null || echo "No frame captured"

echo ""
echo "Recent kernel errors:"
dmesg | tail -20 | grep -E "irs2877a|vi|csi|timeout|err"
