FROM        phusion/baseimage:latest
MAINTAINER  Michael B. Klein <michael.klein@northwestern.edu>
RUN         apt-get update && apt-get upgrade -y
RUN         apt-get install -y mediainfo ffmpeg x264 
RUN         apt-get install -y build-essential git libpcre3-dev zlib1g-dev libssl-dev libavcodec-dev
RUN         apt-get clean

ADD         build-nginx.sh /usr/src/build-nginx.sh
RUN         /usr/src/build-nginx.sh

EXPOSE      1935
EXPOSE      80

RUN         useradd nginx
RUN         mkdir /data
RUN         mkdir -p /var/log/nginx && chown nginx /var/log/nginx
ADD         stat.xsl  /etc/nginx/stat.xsl
RUN         mkdir /etc/service/nginx
RUN         ln -s /usr/local/nginx/sbin/nginx /etc/service/nginx/run
ADD         nginx.conf /etc/nginx/nginx.conf
