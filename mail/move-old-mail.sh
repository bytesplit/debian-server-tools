#!/bin/bash
#
# Move old messages to another location.
#
# VERSION       :0.1.1
# DATE          :2015-08-08
# AUTHOR        :Viktor Szépe <viktor@szepe.net>
# URL           :https://github.com/szepeviktor/debian-server-tools
# LICENSE       :The MIT License (MIT)
# BASH-VERSION  :4.2+
# LOCATION      :/usr/local/sbin/move-old-mail.sh

# Move every message before January 1st, 2010
#
#     move-old-mail.sh 2010 /var/mail/domain/user

YEAR="$1"
MAIL_DIR="$2"

DEST_DIR="/var/mail/pre-${YEAR}"

[ $# == 2 ] || exit 1
[ -d "$MAIL_DIR" ] || exit 2
[ "$YEAR" -gt "$(date "+%Y")" ] && exit 3

mkdir -v -p "$DEST_DIR" || exit 4

NOW="$(date "+%s")"
YEAR_START="$(date -d "${YEAR}-01-01 00:00:00" "+%s")"
# Add one day to be sure
MTIME="$(( ( NOW - YEAR_START ) / 3600 / 24 + 1 ))"

find "$MAIL_DIR" -type f -mtime "+${MTIME}" -path "*/cur/*" \
    | cpio --pass-through --make-directories --preserve-modification-time --dot "$DEST_DIR"
