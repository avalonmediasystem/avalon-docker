# DOCKER-VERSION 1.1.2

FROM        phusion/baseimage:0.9.19
ARG         MATTERHORN_VER=1.4
ARG         MATTERHORN_BRANCH=1.4.x
RUN         ["/usr/bin/apt-get","update"]
RUN         ["/usr/bin/apt-get","install","-y","openjdk-8-jdk-headless","jam","libjpeg-turbo-progs","libpng3", \
             "libtiff5","scons","libsdl2-2.0-0","zlib1g","mediainfo","tesseract-ocr","ffmpeg","x264"]
RUN         ["/usr/sbin/groupadd","-g","500","matterhorn"]
RUN         ["/usr/sbin/useradd","-u","500","-g","500","-M","-r","matterhorn"]
RUN         ["/bin/mkdir","-p","/usr/local/matterhorn"]
WORKDIR     /usr/local/matterhorn
ADD         https://codeload.github.com/avalonmediasystem/avalon-felix/tar.gz/${MATTERHORN_BRANCH} /tmp/matterhorn-${MATTERHORN_VER}.tar.gz
RUN         /bin/tar xzf /tmp/matterhorn-${MATTERHORN_VER}.tar.gz --strip-components 1
ADD         config.properties /usr/local/matterhorn/etc/config.properties
ADD         avalon.properties /usr/local/matterhorn/etc/encoding/avalon.properties
RUN         ["/bin/chown","-R","matterhorn:matterhorn","/usr/local/matterhorn"]
EXPOSE      8080
RUN         ["/bin/mkdir","/etc/service/matterhorn"]
ADD         link_work_dir.sh /etc/my_init.d/30_link_work_dir.sh
ADD         matterhorn.sh /etc/service/matterhorn/run
