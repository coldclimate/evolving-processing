#!/bin/bash
ffmpeg -r 60 -f image2 -s 1024x800 -i %04d.png -vcodec libx264 -crf 25  -pix_fmt yuv420p results/videos/$(date +%Y_%m_%d).mp4
mv 1024.png results/images/
# rm *.png

