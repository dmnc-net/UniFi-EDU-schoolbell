#!/bin/bash
inputfile="$1"
filename="${inputfile%%.*}"
sox -V $inputfile -r 8000 -c 1 -t al $filename.alaw
#sox -V $inputfile -r 8000 -c 1 -t ul /usr/share/asterisk/sounds/custom/$filename.ulaw
