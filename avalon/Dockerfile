FROM        phusion/passenger-ruby24
LABEL       maintainer="Michael B. Klein <michael.klein@northwestern.edu>, Phuong Dinh <pdinh@indiana.edu>"
RUN         apt-get update && apt-get install -y \
            mediainfo \
            ffmpeg \
            x264 \
            cmake \
            pkg-config \
            lsof \
            sendmail \
         && rm -rf /var/lib/apt/lists/* \
         && apt-get clean
RUN         ln -s /usr/bin/lsof /usr/sbin/ && \
            rm /etc/nginx/sites-enabled/default && \
            rm -f /etc/service/nginx/down && \
            ln -s /etc/nginx/sites-available/avalon /etc/nginx/sites-enabled/avalon && \
            chown app:docker_env /etc/container_environment.sh
ARG         AVALON_REPO=https://github.com/avalonmediasystem/avalon.git
ARG         AVALON_BRANCH=master
WORKDIR     /home/app
USER        app
RUN         git clone --branch=${AVALON_BRANCH} --depth=1 ${AVALON_REPO}
ADD         Gemfile.local /home/app/avalon/
ADD         config /home/app/avalon/config/
ARG         RAILS_ENV=production
RUN         cd avalon && \
              gem install bundler && \
              bundle config build.nokogiri --use-system-libraries && \
              bundle install --path=vendor/gems --with postgres --without development test profiling mysql && \
              cd ..
ARG         BASE_URL
ARG         DATABASE_URL
ARG         SECRET_KEY_BASE
RUN         cd avalon && \
              mkdir -p tmp/pids && \
              bundle exec whenever -w -f config/docker_schedule.rb && \
              bundle exec rake assets:precompile && \
              cp config/controlled_vocabulary.yml.example config/controlled_vocabulary.yml && \
              cd ..
USER        root
RUN         chown -R app:app /home/app/avalon
ADD         ./avalon.conf /etc/nginx/sites-available/avalon
ADD         ./nginx_env.conf /etc/nginx/main.d/env.conf
ADD         rails_init.sh /etc/my_init.d/30_rails_init.sh
