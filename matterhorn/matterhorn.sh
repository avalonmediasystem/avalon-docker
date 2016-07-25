#!/bin/sh
cd /usr/local/matterhorn
exec /sbin/setuser matterhorn /usr/local/matterhorn/bin/start_matterhorn.sh >>/var/log/matterhorn.log 2>&1
