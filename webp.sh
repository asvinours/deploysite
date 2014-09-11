#!/bin/bash
# 1 arg - prog (cwebp|gif2webp), 2 arg - folder full path, if those 2 args are not passed we exit
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ -z "${1}" -o -z "${2}" ]; then 
    exit
fi

if [ "$1" == "jpg"  ]; then
    find "$2" -iregex ".*\.\(jpe?g\)" -exec bash -c 'for x; do x=${x#./}; ./cwebp -mt -m 6 "$x" -o "$x.webp"; done' _ {} +
fi

if [ "$1" == "png"  ]; then
    find "$2" -iregex ".*\.\(png\)" -exec bash -c 'for x; do x=${x#./}; ./cwebp -mt -m 6 "$x" -o "$x.webp"; done' _ {} +
fi

if [ "$1" == "gif"  ]; then
    find "$2" -iregex ".*\.\(gif\)" -exec bash -c 'for x; do x=${x#./}; ./gif2webp -mt -m 6 "$x" -o "$x.webp"; done' _ {} +;
fi

