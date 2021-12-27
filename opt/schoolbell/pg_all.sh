#!/bin/bash
BASEDIR="${0%/*}"
#ASTERISK=$(which asterisk)
ASTERISK="/usr/sbin/asterisk"
EXTEN=$1
SOUND=$2
OPT=$3
if [[ ! $EXTEN || ! $SOUND ]]; then
    echo "Missing parameters: $0 <EXTEN> <SOUND> [force] ";
    grep -E 'exten.*Page' /etc/asterisk/extensions.conf
    false; exit
fi
if [[ $OPT != "force" ]]; then $BASEDIR/check_exception.py||exit; fi
echo "`date` $UID $EXTEN $SOUND">>/tmp/ringbell.log
echo $UID
$ASTERISK -rx "channel originate Local/$EXTEN@EDU application Playback $SOUND"
