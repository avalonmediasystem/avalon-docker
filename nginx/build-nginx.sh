#!/bin/sh
cd /usr/src && apt-get source nginx && mv nginx-* nginx
cd /usr/src && git clone https://github.com/kaltura/nginx-vod-module.git && cd nginx-vod-module && git checkout -b latest-tag $(git describe --tags)
cd /usr/src/nginx
./configure --with-file-aio --with-cc-opt="-O3" --conf-path=/etc/nginx/nginx.conf \
    --add-module=/usr/src/nginx-vod-module \
    --with-http_auth_request_module --with-http_sub_module \
    --error-log-path=/var/log/nginx/error.log --http-log-path=/var/log/nginx/access.log
make && make install
cd /
rm -rf /usr/src/*
