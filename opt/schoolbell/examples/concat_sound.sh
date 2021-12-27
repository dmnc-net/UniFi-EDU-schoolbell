#!/bin/bash
DIR="/usr/share/asterisk/sounds/recordings"
EXT="alaw"
FORMAT="-r 8000 -c1 -t al"
rm $DIR/_merged.$EXT
sox $FORMAT $DIR/$1.$EXT $FORMAT $DIR/$2.$EXT $FORMAT $DIR/_merged.$EXT
