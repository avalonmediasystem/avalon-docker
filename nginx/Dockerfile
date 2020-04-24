FROM        phusion/baseimage:0.11 as builder
RUN         DEBIAN_FRONTEND=noninteractive; \
            apt-get update \
         && apt-get install -y \ 
            mediainfo \
            ffmpeg \
            x264 \
            build-essential \
            git \
            libpcre3-dev \
            zlib1g-dev \
            libssl-dev \
            dnsmasq \
            # gettext-base provides 'envsubst', used by nginx.sh
            gettext-base

ADD         build-nginx.sh /usr/src/build-nginx.sh
RUN         /usr/src/build-nginx.sh


FROM        phusion/baseimage:0.11
LABEL       maintainer="Michael B. Klein <michael.klein@northwestern.edu>, Phuong Dinh <pdinh@indiana.edu>"

COPY        --from=builder /usr/local/nginx /usr/local/nginx
COPY        --from=builder /etc/nginx /etc/nginx

RUN         apt-get update \
         && apt-get install -y \
            dnsmasq \
            gettext-base \
         && apt-get clean

EXPOSE      1935
EXPOSE      80

RUN         useradd nginx
RUN         mkdir /data && chmod 0777 /data \
         && mkdir -p /var/log/nginx && chown nginx /var/log/nginx \
         && mkdir /etc/service/dnsmasq \
         && mkdir /etc/service/nginx

ADD         stat.xsl  /etc/nginx/stat.xsl
ADD         nginx.conf.template /etc/nginx/nginx.conf.template
ADD         dnsmasq.sh /etc/service/dnsmasq/run
ADD         nginx.sh /etc/service/nginx/run

RUN         chmod +x /etc/service/nginx/run

VOLUME      /data

HEALTHCHECK --interval=1m30s --timeout=10s CMD curl --fail -s http://localhost/status || exit 1