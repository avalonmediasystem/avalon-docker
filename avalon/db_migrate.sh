#!/bin/bash
chmod 0777 /masterfiles
su -c "cd /home/app/avalon && bundle exec rake db:migrate" app
