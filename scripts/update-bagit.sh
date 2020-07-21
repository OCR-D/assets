#!/bin/bash
data_files=($(find data -type f|sort -h))
sha512sum "${data_files[@]}" > manifest-sha512.txt
sha512sum manifest-sha512.txt bagit.txt bag-info.txt > tagmanifest-sha512.txt
file_no="${#data_files[@]}"
oxum=$(du -bs "${data_files[@]}"|awk '{s+=$1} END {print s}')
sed -i "s/^ *Payload-Oxum:.*/Payload-Oxum: $oxum.$file_no/" bag-info.txt
