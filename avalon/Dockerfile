FROM        phusion/passenger-ruby24
LABEL       maintainer="Michael B. Klein <michael.klein@northwestern.edu>, Phuong Dinh <pdinh@indiana.edu>"
RUN         curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
         && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
         && curl -sL https://deb.nodesource.com/setup_8.x | bash -  
RUN         apt-get update && apt-get install -y \
            mediainfo \
            ffmpeg \
            x264 \
            cmake \
            pkg-config \
            lsof \
            sendmail \
            yarn \
            vim \
            nodejs \
            tzdata \
         && rm -rf /var/lib/apt/lists/* \
         && apt-get clean
RUN         ln -s /usr/bin/lsof /usr/sbin/ \
         && rm /etc/nginx/sites-enabled/default \
         && rm -f /etc/service/nginx/down \
         && ln -s /etc/nginx/sites-available/avalon /etc/nginx/sites-enabled/avalon \
         && chown app:docker_env /etc/container_environment.sh
ARG         AVALON_REPO=https://github.com/avalonmediasystem/tbd.git
ARG         AVALON_BRANCH=master
USER        app
RUN         git clone --branch=${AVALON_BRANCH} --depth=1 ${AVALON_REPO} /home/app/avalon
ADD         config /home/app/avalon/config/
WORKDIR     /home/app/avalon
ARG         RAILS_ENV=production
RUN         gem install bundler \
         && bundle config build.nokogiri --use-system-libraries \
         && bundle install --path=vendor/gems --without development test \
         && yarn install
ARG         BASE_URL
ARG         DATABASE_URL
ARG         SECRET_KEY_BASE
RUN         mkdir -p tmp/pids \
         && bundle exec rake assets:precompile
ADD         ./avalon.conf /etc/nginx/sites-available/avalon
ADD         ./nginx_env.conf /etc/nginx/main.d/env.conf
USER        root
ADD         rails_init.sh /etc/my_init.d/30_rails_init.sh
