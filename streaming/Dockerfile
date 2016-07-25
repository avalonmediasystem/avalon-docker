FROM    phusion/baseimage:0.9.19
ARG     WOWZA_ADMIN_PASSWORD
ARG     WOWZA_ADMIN_USER
ARG     WOWZA_LICENSE_KEY
ARG     WOWZA_SILENT_INSTALL_KEY
RUN     /usr/bin/apt-get update && /usr/bin/apt-get install -y bzip2

ADD     https://www.wowza.com/downloads/WowzaStreamingEngine-4-5-0/WowzaStreamingEngine-4.5.0-linux-x64-installer.run /opt/installer/
RUN     /bin/echo mode=unattended >> /opt/installer/wse4.opt
RUN     /bin/echo silentInstallKey=${WOWZA_SILENT_INSTALL_KEY} >> /opt/installer/wse4.opt
RUN     /bin/echo prefix=/usr/local/WowzaStreamingEngine >> /opt/installer/wse4.opt
RUN     /bin/echo debuglevel=4 >> /opt/installer/wse4.opt
RUN     /bin/echo licensekey=${WOWZA_LICENSE_KEY} >> /opt/installer/wse4.opt
RUN     /bin/echo username=${WOWZA_ADMIN_USER} >> /opt/installer/wse4.opt
RUN     /bin/echo password=${WOWZA_ADMIN_PASSWORD} >> /opt/installer/wse4.opt
RUN     /bin/echo activeVersion=newVersion >> /opt/installer/wse4.opt
RUN     /bin/echo startService=0 >> /opt/installer/wse4.opt
RUN     /bin/chmod 0755 /opt/installer/WowzaStreamingEngine-4.5.0-linux-x64-installer.run
RUN     /opt/installer/WowzaStreamingEngine-4.5.0-linux-x64-installer.run --optionfile /opt/installer/wse4.opt

ADD     https://github.com/avalonmediasystem/wowza-avalon/releases/download/v0.2.0/wowza-avalon-app.tar.bz2 /opt/installer/
RUN     cd /usr/local/WowzaStreamingEngine && tar xjf /opt/installer/wowza-avalon-app.tar.bz2
RUN     /bin/rmdir /usr/local/WowzaStreamingEngine/avalon
RUN     ln -fs /streamfiles /usr/local/WowzaStreamingEngine/avalon
ADD     Application.xml /usr/local/WowzaStreamingEngine/conf/avalon/Application.xml

EXPOSE  1935
RUN     ["/bin/mkdir","/etc/service/wowza"]
ADD     wowza.sh /etc/service/wowza/run
