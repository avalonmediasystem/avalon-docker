FROM        phusion/passenger-ruby22
MAINTAINER  Michael B. Klein <michael.klein@northwestern.edu>
RUN         apt-get update && apt-get upgrade -y
RUN         apt-get install -y mediainfo ffmpeg x264 
RUN         apt-get install -y cmake pkg-config lsof
RUN         apt-get clean
RUN         ln -s /usr/bin/lsof /usr/sbin/
RUN         rm /etc/nginx/sites-enabled/default
RUN         rm -f /etc/service/nginx/down
RUN         ln -s /etc/nginx/sites-available/avalon /etc/nginx/sites-enabled/avalon
ARG         AVALON_REPO=https://github.com/avalonmediasystem/avalon.git
ARG         AVALON_BRANCH=master
WORKDIR     /home/app
USER        app
RUN         git clone --branch=${AVALON_BRANCH} --depth=1 ${AVALON_REPO}
ADD         Gemfile.local /home/app/avalon/
ADD         config/* /home/app/avalon/config/
ADD         production.rb /home/app/avalon/config/environments/
ADD         rewrite_asset_host.rake /home/app/avalon/lib/tasks
RUN         RAILS_ENV=production bash -c \
              "cd avalon && \
              bundle config build.nokogiri --use-system-libraries && \
              bundle install --path=vendor/gems --without development test && \
              cd .."
RUN         RAILS_ENV=production ASSET_HOST=__ASSET_HOST__ BASE_URL=http://foo SECRET_KEY_BASE=bar DATABASE_URL=sqlite3:/baz.sqlite3 bash -c \
              "cd avalon && \
              bundle exec whenever -w && \
              bundle exec rake assets:precompile && \
              mv config/role_map_env.yml config/role_map_${RAILS_ENV}.yml && \
              cp config/controlled_vocabulary.yml.example config/controlled_vocabulary.yml && \
              cd .."
USER        root
RUN         chown -R app:app /home/app/avalon
RUN         mkdir /etc/service/delayed_job
ADD         ./avalon.conf /etc/nginx/sites-available/avalon
ADD         ./nginx_env.conf /etc/nginx/main.d/env.conf
ADD         rails_init.sh /etc/my_init.d/30_rails_init.sh
ADD         avalon_delayed_job.sh /etc/service/delayed_job/run
