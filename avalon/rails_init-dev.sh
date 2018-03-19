#!/bin/bash
cd /home/app/avalon
export HOME=/home/app/avalon
bundle config build.nokogiri --use-system-libraries && \
bundle install --path=/home/app/avalon/gems --with development test && \
yarn install
bundle exec rake assets:precompile

rm -f tmp/pids/server.pid
bundle exec rake db:migrate
bundle exec rails hyrax:default_collection_types:create
bundle exec rails hyrax:default_admin_set:create
bundle exec rails server -b 0.0.0.0 -p 80 
tail -f /dev/null

# batch ingest cronjob wouldn't autorun without this
#touch /var/spool/cron/crontabs/app

#cd public/assets/mediaelement_rails
#if [ ! -e flashmediaelement.swf ]; then
#  ln -s flashmediaelement-*.swf flashmediaelement.swf
#fi
