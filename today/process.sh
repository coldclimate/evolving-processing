#!/bin/bash -e
ffmpeg -r 20 -f image2 -i %04d.png -f mp4 -q:v 0 -vcodec mpeg4 -r 20 results/videos/$(date +%Y_%m_%d).mp4
mv 1000.png results/images/$(date +%Y_%m_%d).png
rm *.png

