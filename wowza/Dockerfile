FROM        phusion/baseimage:latest
MAINTAINER  Michael B. Klein <michael.klein@northwestern.edu>
RUN         apt-get update && apt-get upgrade -y
ARG         WOWZA_ADMIN_PASSWORD
ARG         WOWZA_ADMIN_USER
ARG         WOWZA_LICENSE_KEY
ARG         WOWZA_SILENT_INSTALL_KEY
RUN         apt-get install -y bzip2 && apt-get clean

ADD         https://www.wowza.com/downloads/WowzaStreamingEngine-4-5-0/WowzaStreamingEngine-4.5.0-linux-x64-installer.run /opt/installer/
RUN         echo mode=unattended >> /opt/installer/wse4.opt
RUN         echo silentInstallKey=${WOWZA_SILENT_INSTALL_KEY} >> /opt/installer/wse4.opt
RUN         echo prefix=/usr/local/WowzaStreamingEngine >> /opt/installer/wse4.opt
RUN         echo debuglevel=4 >> /opt/installer/wse4.opt
RUN         echo licensekey=${WOWZA_LICENSE_KEY} >> /opt/installer/wse4.opt
RUN         echo username=${WOWZA_ADMIN_USER} >> /opt/installer/wse4.opt
RUN         echo password=${WOWZA_ADMIN_PASSWORD} >> /opt/installer/wse4.opt
RUN         echo activeVersion=newVersion >> /opt/installer/wse4.opt
RUN         echo startService=0 >> /opt/installer/wse4.opt
RUN         chmod 0755 /opt/installer/WowzaStreamingEngine-4.5.0-linux-x64-installer.run
RUN         /opt/installer/WowzaStreamingEngine-4.5.0-linux-x64-installer.run --optionfile /opt/installer/wse4.opt

ADD         https://github.com/avalonmediasystem/wowza-avalon/releases/download/v0.2.0/wowza-avalon-app.tar.bz2 /opt/installer/
RUN         cd /usr/local/WowzaStreamingEngine && tar xjf /opt/installer/wowza-avalon-app.tar.bz2
RUN         rmdir /usr/local/WowzaStreamingEngine/avalon
RUN         ln -fs /streamfiles /usr/local/WowzaStreamingEngine/avalon
ADD         Application.xml /usr/local/WowzaStreamingEngine/conf/avalon/Application.xml

EXPOSE      1935
RUN         mkdir /etc/service/wowza
ADD         wowza.sh /etc/service/wowza/run
