#!/bin/bash
BASEDIR="/opt/schoolbell"
if [[ ! -d "backup" ]]; then
    echo "init for backups ..."
    mkdir -p $BASEDIR/backup/.root
    cd $BASEDIR/backup/.root
    mkdir -p etc etc/apt opt usr/local/share/asterisk
    mkdir -p var/lib/asterisk/sounds var/spool/cron/crontabs var/www
    ln -s /etc/asterisk etc/asterisk
    ln -s /etc/apt/preferences.d etc/apt
    ln -s /etc/apt/sources.list.d etc/apt
    ln -s /etc/sudoers etc
    ln -s /opt/schoolbell opt
    ln -s /usr/local/share/asterisk/sounds usr/local/share/asterisk
    ln -s /var/lib/asterisk/sounds/custom var/lib/asterisk/sounds
    ln -s /var/spool/cron/crontabs/root var/spool/cron/crontabs
    ln -s /var/www/html var/www
    ln -s /var/www/cgi-bin var/www
fi

cd $BASEDIR/backup/.root
XZ_OPT="-9e" tar --exclude=*.pyc --exclude=opt/schoolbell/backup -cahvf ../schoolbell_backup-`date "+%Y%m%d"`.tar.xz .
