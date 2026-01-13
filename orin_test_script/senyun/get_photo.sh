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
timeout 10 v4l2-ctl -d /dev/video0 --set-fmt-video=width=1920,height=1536,pixelformat=UYVY --stream-mmap --stream-count=50 --stream-to=/tmp/frame1.raw --verbose
timeout 10 v4l2-ctl -d /dev/video1 --set-fmt-video=width=1920,height=1536,pixelformat=UYVY --stream-mmap --stream-count=50 --stream-to=/tmp/frame2.raw --verbose
timeout 10 v4l2-ctl -d /dev/video2 --set-fmt-video=width=1920,height=1536,pixelformat=UYVY --stream-mmap --stream-count=50 --stream-to=/tmp/frame3.raw --verbose
timeout 10 v4l2-ctl -d /dev/video3 --set-fmt-video=width=1920,height=1536,pixelformat=UYVY --stream-mmap --stream-count=50 --stream-to=/tmp/frame4.raw --verbose

echo ""
echo "Capture result:"
ls -lh /tmp/frame.raw 2>/dev/null || echo "No frame captured"

echo ""
echo "Recent kernel errors:"
dmesg | tail -20 | grep -E "isx031|vi|csi|timeout|err"
