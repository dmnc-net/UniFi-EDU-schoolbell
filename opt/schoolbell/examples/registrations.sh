#!/bin/sh

/usr/sbin/asterisk -rx "pjsip list endpoints"

/usr/sbin/asterisk -rx "pjsip list endpoints" | grep "Endpoint:  $prefix" | grep "Unavailable"
