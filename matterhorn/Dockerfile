FROM        phusion/baseimage:latest
MAINTAINER  Michael B. Klein <michael.klein@northwestern.edu>
RUN         apt-get update && apt-get upgrade -y
RUN         apt-get install -y mediainfo ffmpeg x264 
ARG         MATTERHORN_VER=1.4
ARG         MATTERHORN_BRANCH=1.4.x
RUN         apt-get install -y openjdk-8-jdk-headless jam libjpeg-turbo-progs libpng3 \
              libtiff5 scons libsdl2-2.0-0 zlib1g tesseract-ocr
RUN         apt-get clean
RUN         groupadd -g 500 matterhorn
RUN         useradd -u 500 -g 500 -M -r matterhorn
RUN         /bin/mkdir -p /usr/local/matterhorn
WORKDIR     /usr/local/matterhorn
ADD         https://codeload.github.com/avalonmediasystem/avalon-felix/tar.gz/${MATTERHORN_BRANCH} /tmp/matterhorn-${MATTERHORN_VER}.tar.gz
RUN         tar xzf /tmp/matterhorn-${MATTERHORN_VER}.tar.gz --strip-components 1
ADD         config.properties /usr/local/matterhorn/etc/config.properties
ADD         avalon.properties /usr/local/matterhorn/etc/encoding/avalon.properties
RUN         chown -R matterhorn:matterhorn /usr/local/matterhorn
EXPOSE      8080
RUN         mkdir /etc/service/matterhorn
ADD         link_work_dir.sh /etc/my_init.d/30_link_work_dir.sh
ADD         matterhorn.sh /etc/service/matterhorn/run
