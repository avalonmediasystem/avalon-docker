FROM        phusion/baseimage:0.11
MAINTAINER  Michael B. Klein <michael.klein@northwestern.edu>
RUN         apt-get update && apt-get upgrade -y \
         && apt-get install -y mediainfo ffmpeg x264 \
            build-essential git libpcre3-dev zlib1g-dev libssl-dev dnsmasq \
            # gettext-base provides 'envsubst', used by nginx.sh
            gettext-base \
         && apt-get clean

ADD         build-nginx.sh /usr/src/build-nginx.sh
RUN         /usr/src/build-nginx.sh

EXPOSE      1935
EXPOSE      80

RUN         useradd nginx
RUN         mkdir /data \
         && mkdir -p /var/log/nginx \
         && chown nginx /var/log/nginx
ADD         stat.xsl  /etc/nginx/stat.xsl

ADD         nginx.conf.template /etc/nginx/nginx.conf.template
RUN         mkdir /etc/service/dnsmasq
ADD         dnsmasq.sh /etc/service/dnsmasq/run
RUN         mkdir /etc/service/nginx
ADD         nginx.sh /etc/service/nginx/run
RUN         chmod +x /etc/service/nginx/run

HEALTHCHECK --interval=1m30s --timeout=10s CMD curl --fail -s http://localhost/status || exit 1
