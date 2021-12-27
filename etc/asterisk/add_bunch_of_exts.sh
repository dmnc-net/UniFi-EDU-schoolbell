#!/bin/sh
FILE="pjsip.conf"
for EXT in $(seq $1 $2); do
    echo>>$FILE
    echo "[$EXT](def-endpoint)">>$FILE
    echo "auth=a$EXT">>$FILE
    echo "aors=$EXT">>$FILE
    echo "[$EXT](def-aor)">>$FILE
    echo "[a$EXT](def-auth)">>$FILE
    echo "username=$EXT">>$FILE
done