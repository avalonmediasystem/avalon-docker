#!/bin/bash
cd /home/app/avalon
export RAILS_ENV=production
exec /sbin/setuser app bundle exec script/delayed_job run > /var/log/avalon_delayed_job.log
