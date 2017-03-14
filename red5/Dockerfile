FROM java:openjdk-7-jdk
MAINTAINER Phuong Dinh <phuongdh@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

# Define RED5_HOME variable
ENV RED5_HOME /usr/local/red5

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN wget http://repo.avalonmediasystem.org/red5-1.0.1.tar.gz && \
    tar xvf red5-1.0.1.tar.gz && \
    mv red5-server-1.0 ${RED5_HOME} && \
    rm red5-1.0.1.tar.gz

EXPOSE 843 1935 5080 5443 8081 8443
WORKDIR $RED5_HOME

ENV AVALON_URL http://avalon/
RUN cd $RED5_HOME/webapps && \
    wget https://github.com/avalonmediasystem/avalon-installer/raw/master/modules/avalon/files/red5/red5-avalon.tar.gz && \
    tar xvzf red5-avalon.tar.gz && \
    echo "\navalon.serverUrl=${AVALON_URL}\navalon.streamBase=/data" >> avalon/WEB-INF/red5-web.properties

ENTRYPOINT ["./red5.sh"]
