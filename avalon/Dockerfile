FROM    phusion/passenger-ruby22
ENV     RAILS_ENV production
ARG     AVALON_SECRET_KEY_BASE
ARG     AVALON_BRANCH=master
RUN     ["/usr/bin/apt-get","update"]
RUN     ["/usr/bin/apt-get","install","-y","mediainfo","ffmpeg","x264","cmake","pkg-config","lsof"]
RUN     ln -s /usr/bin/lsof /usr/sbin/
RUN     rm /etc/nginx/sites-enabled/default
RUN     rm -f /etc/service/nginx/down
RUN     ln -s /etc/nginx/sites-available/avalon /etc/nginx/sites-enabled/avalon
WORKDIR /home/app
USER    app
RUN     git clone --branch=${AVALON_BRANCH} --depth=1 https://github.com/avalonmediasystem/avalon.git
ADD     Gemfile.local /home/app/avalon/
ADD     config/* /home/app/avalon/config/
RUN     cd avalon && \
          bundle install --path=vendor/gems && \
          bundle exec whenever -w && \
          bundle exec rake assets:precompile && \
          mv config/role_map_env.yml config/role_map_${RAILS_ENV}.yml && \
          cp config/controlled_vocabulary.yml.example config/controlled_vocabulary.yml && \
          cd ..
USER    root
RUN     ["/bin/chown","-R","app:app","/home/app/avalon"]
RUN     ["/bin/mkdir","/etc/service/delayed_job"]
ADD     ./avalon.conf /etc/nginx/sites-available/avalon
ADD     ./nginx_env.conf /etc/nginx/main.d/env.conf
ADD     precompile_assets.sh /etc/my_init.d/30_precompile_assets.sh
ADD     avalon_delayed_job.sh /etc/service/delayed_job/run
