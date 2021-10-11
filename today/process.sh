#!/bin/bash -e
ffmpeg -r 20 -f image2 -i %04d.png -f mp4 -q:v 0 -vcodec mpeg4 -r 20 results/videos/temp.mp4
ffmpeg -i results/videos/temp.mp4 -vcodec libx264 -vf 'scale=640:trunc(ow/a/2)*2' -acodec aac -vb 1024k -minrate 1024k -maxrate 1024k -bufsize 1024k -ar 44100 -strict experimental -r 30 results/videos/$(date +%Y_%m_%d).mp4
mv 1000.png results/images/$(date +%Y_%m_%d).png
rm *.png
rm results/videos/temp.mp4

