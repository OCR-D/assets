#!/bin/bash

cd data/ground-truth/
for i in $(ls *.gt.txt);do
    work=$(echo $i|sed -e 's/.gt.txt//' -e 's/\(_[0-9]\+\)\{2\}$//')
    page=$(echo $i|sed -e 's/.gt.txt//' -e "s/.*${work}_//" -e 's/_[0-9]\+$//')
    yml_file="${i%.gt.txt}.yml"
    echo "---
teiUrl: \"http://www.deutschestextarchiv.de/book/download_xml/${work}\"
imageUrl: \"http://media.dwds.de/dta/images/${work}/${work}_${page}_1600px.jpg\"
" > "$yml_file"
done
