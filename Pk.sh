#!/bin/bash

# .ts ফাইলের URL
TS_URL="http://tv.cloudcdn.me/live.ts?channelId=265&uid=16068&deviceMac=00:1A:79:ED:10:29"

# FFmpeg কমান্ড: .ts থেকে .m3u8 কনভার্ট
ffmpeg -i "$TS_URL" \
-c:v libx264 -preset fast -crf 22 -c:a aac -b:a 128k -ar 44100 -f hls \
-hls_time 10 -hls_list_size 6 -hls_segment_filename "segment_%03d.ts" output.m3u8
