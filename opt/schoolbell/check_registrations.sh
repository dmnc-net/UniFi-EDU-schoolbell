#!/bin/bash
from="EDUsterisk by CellBest"
rcpt="admin@domain.com"
prefix="1"
ip="10.0.3."
ignorelist="${0%/*}/check_registrations.ignorelist"

quiet=false
report=false
for arg in "$@"; do
    case "$arg" in
	'quiet') quiet=true;;
	'report') report=true;quiet=true;;
    esac
done

failed=( $(/usr/sbin/asterisk -rx "pjsip list endpoints" | grep "Endpoint:  $prefix" | grep "Unavailable" | grep -v -f $ignorelist | awk '{print $2}') )
count=${#failed[@]}
subject="SIP Registration Alarm"
msg="SIP clients ($count) not registered:"

if [ $count -gt 0 ]; then
    if ! $quiet ; then printf "%s\n%s\n" "$msg" "${failed[@]}"; fi
    if $report ; then printf "%s\n%s\n" "$msg" "${failed[@]}"|mail -a "From: $from" -s "$subject" "$rcpt"; fi
    false; exit
fi
if ! $quiet ; then echo "OK"; fi
