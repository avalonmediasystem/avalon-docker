#!/bin/bash

# batch ingest cronjob wouldn't autorun without this
touch /var/spool/cron/crontabs/app

cd /home/app/avalon
su -m -c "bundle exec rake db:migrate" app

#tail -f /home/app/avalon/log/${RAILS_ENV}.log
