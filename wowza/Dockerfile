FROM        wowzamedia/wowza-streaming-engine-linux:4.7.1
LABEL       maintainer="Michael B. Klein <michael.klein@northwestern.edu>, Phuong Dinh <pdinh@indiana.edu>"

ADD         https://github.com/avalonmediasystem/wowza-avalon/releases/download/v0.2.0/wowza-avalon-app.tar.bz2 /usr/local/WowzaStreamingEngine
RUN         rmdir /usr/local/WowzaStreamingEngine/avalon \
         && ln -fs /data /usr/local/WowzaStreamingEngine/avalon
ADD         Application.xml /usr/local/WowzaStreamingEngine/conf/avalon/Application.xml

EXPOSE      1935
ENTRYPOINT  /sbin/entrypoint.sh
