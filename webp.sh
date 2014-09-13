#!/bin/bash
# 1 arg - prog (cwebp|gif2webp), 2 arg - folder full path, if those 2 args are not passed we exit

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
export PATH=$DIR:$PATH

if [ -z "${1}" -o -z "${2}" ]; then 
    echo "Unsufficient information. Exit"
    exit
fi

if [ "$1" == "jpg"  ]; then
    echo "Compressing jpg to webp";
    find "$2" -iregex ".*\.\(jpe?g\)" -exec bash -c 'for x; do x=${x#./}; cwebp -af -metadata none -mt -m 6 "$x" -o "$x.webp"; done' _ {} +;
fi

if [ "$1" == "png"  ]; then
    echo "Compressing png to webp";
    find "$2" -iregex ".*\.\(png\)" -exec bash -c 'for x; do x=${x#./}; cwebp -af -metadata none -mt -m 6 "$x" -o "$x.webp"; done' _ {} +;
fi

if [ "$1" == "gif"  ]; then
    echo "Compressing gif to webp";
    find "$2" -iregex ".*\.\(gif\)" -exec bash -c 'for x; do x=${x#./}; gif2webp -mt -m 6 "$x" -o "$x.webp"; done' _ {} +;
fi

