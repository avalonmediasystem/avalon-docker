#!/bin/sh
cd /usr/local/matterhorn
# Log to stdout instead of logfile
exec /sbin/setuser matterhorn /usr/local/matterhorn/bin/start_matterhorn.sh >>/proc/1/fd/1 2>&1
