FROM    phusion/passenger-ruby22
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
ARG     RAILS_ENV=production
RUN     cd avalon && \
          bundle config build.nokogiri --use-system-libraries && \
          bundle install --path=vendor/gems --without development test && \
          cd ..
ARG     BASE_URL=http://avalon:80/
ARG     SECRET_KEY_BASE
ARG     DATABASE_URL
ENV     APP_NAME SECRET_KEY_BASE BASE_URL CONTROLLED_VOCABULARY DATABASE_URL DROPBOX_PATH \
        DROPBOX_URI EMAIL_COMMENTS EMAIL_NOTIFICATION EMAIL_SUPPORT FEDORA_NAMESPACE FEDORA_URL \
        FFMPEG_PATH MASTER_FILE_PATH MASTER_FILE_STRATEGY MATTERHORN_URL MEDIAINFO_PATH \
        RAILS_ENV SMTP_ADDRESS SMTP_AUTHENTICATION SMTP_DOMAIN SMTP_ENABLE_STARTTLS_AUTO \
        SMTP_OPENSSL_VERIFY_MODE SMTP_PASSWORD SMTP_PORT SMTP_USER_NAME SOLR_URL STREAM_BASE \
        STREAM_DEFAULT_QUALITY STREAM_HTTP_BASE STREAM_RTMP_BASE STREAM_SERVER STREAM_TOKEN_TTL \
        SYSTEM_GROUPS Z3950_ATTRIBUTE Z3950_DATABASE Z3950_HOST Z3950_PORT
RUN     cd avalon && \
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
ADD     db_migrate.sh /etc/my_init.d/30_db_migrate.sh
ADD     avalon_delayed_job.sh /etc/service/delayed_job/run
