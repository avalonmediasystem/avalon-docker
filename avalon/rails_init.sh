#!/bin/bash
chmod 0777 /masterfiles
chown -R app /masterfiles
cd /home/app/avalon
su app
BACKGROUND=yes QUEUE=* bundle exec rake resque:work
BACKGROUND=yes bundle exec rake environment resque:scheduler
RAILS_ENV=production bundle exec rake db:migrate
exit
cd public/assets/mediaelement_rails
if [ ! -e flashmediaelement.swf ]; then
  ln -s flashmediaelement-*.swf flashmediaelement.swf
fi
