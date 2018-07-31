#!/bin/bash
# 1 is a file with mp4 names, 2 is the directory where the files are
echo $1
echo $2
while IFS='' read -r line || [[ -n "$line" ]]; do
    mp4_fname="$2$line"
   # echo $mp4_fname
    base_fname=${mp4_fname%.*}
    gif_fname="$base_fname.mp4"
    echo "converting $mp4_fname to $gif_fname"
    ffmpeg -i $mp4_fname -framerate 5 $gif_fname
done < "$1"


