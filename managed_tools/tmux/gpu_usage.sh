#!/bin/sh
#
# Print the GPU's utilization in percent for the tmux status line, averaged over the
# time since the previous call, so it covers the whole status interval.
#
# macOS keeps a running total of GPU time (ns) for every process that uses the GPU, the
# counters behind Activity Monitor's "% GPU". Sum them, and compare the sum with the one
# saved by the previous call. A process that quits takes its total with it, so clamp the
# result to 0-100. Without a previous sum, or without the counters (Intel Macs), print
# the driver's instant reading instead.

state="${TMPDIR:-/tmp}/tmux-gpu-usage"

instant() {
    ioreg -rd1 -w0 -c IOAccelerator | grep -o '"Device Utilization %"=[0-9]*' | cut -d= -f2
}

now=$(perl -MTime::HiRes=time -e 'printf "%.0f", time * 1e9')
total=$(ioreg -l -w0 -r -c AGXDeviceUserClient | grep -o '"accumulatedGPUTime"=[0-9]*' |
    cut -d= -f2 | paste -sd+ - | bc)
if [ -z "$total" ]; then
    instant
    exit
fi

prev_now='' prev_total=''
[ -f "$state" ] && read -r prev_now prev_total < "$state"
echo "$now $total" > "$state"
if [ -z "$prev_total" ]; then
    instant
    exit
fi

awk -v now="$now" -v total="$total" -v prev_now="$prev_now" -v prev_total="$prev_total" 'BEGIN {
    p = now > prev_now ? 100 * (total - prev_total) / (now - prev_now) : 0
    if (p < 0) p = 0
    if (p > 100) p = 100
    printf "%d\n", p + 0.5
}'
