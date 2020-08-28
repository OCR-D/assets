#!/bin/bash

fileGrp="OCR-D-IMG"

_prompt_yn () {
    echo
    read -p ">>> $1 " -n 1
    echo
    if [[ $REPLY =~ ^[Yy]$ ]];then
        return 0
    else
        return 1
    fi
}

_prompt_yn "Downloading images?" && {
    mkdir -p $fileGrp
    while read l;do
        work=$(echo "$l"|cut -d, -f 1)
        page=$(echo "$l"|cut -d, -f 2)
        wget -O "${fileGrp}/${work}-$page.jpg" "http://media.dwds.de/dta/images/${work}/${work}_${page}_1600px.jpg"
    done < sources.csv
}

_prompt_yn "METSify?" && {
    ocrd workspace init
    while read l;do
        work=$(echo "$l"|cut -d, -f 1)
        page=$(echo "$l"|cut -d, -f 2)
        ocrd workspace add \
            --file-grp $fileGrp \
            --mimetype image/jpeg \
            --file-id ${fileGrp}-${work}-${page} \
            --group-id ${work}-${page} \
            $fileGrp/${work}-${page}.jpg
    done < sources.csv
}

_prompt_yn "GitHub-ify local links?" && {
    sed -i "s,file://$PWD,https://github.com/OCR-D/assets/raw/master/data/column-samples," mets.xml
}
