FROM        phusion/baseimage:latest
LABEL       maintainer="Michael B. Klein <michael.klein@northwestern.edu>, Phuong Dinh <pdinh@indiana.edu>"
RUN         apt-get update && apt-get install -y \ 
            mediainfo \ 
            ffmpeg \
            x264 \
            openjdk-8-jre-headless \
            jam \
            libjpeg-turbo-progs \
            libpng3 \
            libsdl2-2.0-0 \
            libtiff5 \ 
            scons \
            tesseract-ocr \
            zlib1g \
         && rm -rf /var/lib/apt/lists/* \
         && apt-get clean
ARG         MATTERHORN_VER=1.4
ARG         MATTERHORN_BRANCH=1.4.x
RUN         curl https://codeload.github.com/avalonmediasystem/avalon-felix/tar.gz/${MATTERHORN_BRANCH} | tar xz \ 
         && mv avalon-felix-1.4.x /usr/local/matterhorn
WORKDIR     /usr/local/matterhorn
ADD         config.properties /usr/local/matterhorn/etc/config.properties
ADD         avalon.properties /usr/local/matterhorn/etc/encoding/avalon.properties
RUN         groupadd -g 500 matterhorn && \
            useradd -u 500 -g 500 -M -r matterhorn && \
            chown -R matterhorn:matterhorn /usr/local/matterhorn
EXPOSE      8080
ADD         link_work_dir.sh /etc/my_init.d/30_link_work_dir.sh
ADD         matterhorn.sh /etc/service/matterhorn/run
