#!/bin/sh
asterisk -rx "channel originate Local/$1@EDU application Playback $2"
