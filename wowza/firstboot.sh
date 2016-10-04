#!/bin/bash
if [ -e /opt/installer ]; then
  /bin/echo "Installing Wowza..."
  /bin/echo mode=unattended >> /opt/installer/wse4.opt
  /bin/echo silentInstallKey=${WOWZA_SILENT_INSTALL_KEY} >> /opt/installer/wse4.opt
  /bin/echo prefix=/usr/local/WowzaStreamingEngine >> /opt/installer/wse4.opt
  /bin/echo debuglevel=4 >> /opt/installer/wse4.opt
  /bin/echo licensekey=${WOWZA_LICENSE_KEY} >> /opt/installer/wse4.opt
  /bin/echo username=${WOWZA_ADMIN_USER} >> /opt/installer/wse4.opt
  /bin/echo password=${WOWZA_ADMIN_PASSWORD} >> /opt/installer/wse4.opt
  /bin/echo activeVersion=newVersion >> /opt/installer/wse4.opt
  /bin/echo startService=0 >> /opt/installer/wse4.opt
  /bin/chmod 0755 /opt/installer/WowzaStreamingEngine-4.5.0-linux-x64-installer.run
  /opt/installer/WowzaStreamingEngine-4.5.0-linux-x64-installer.run --optionfile /opt/installer/wse4.opt
  
  cd /usr/local/WowzaStreamingEngine
  curl -L https://github.com/avalonmediasystem/wowza-avalon/releases/download/v0.2.0/wowza-avalon-app.tar.bz2 | tar xj
  ln -fs /streamfiles ./avalon
  
  if [ $? -eq 0 ]; then
    rm -rf /opt/installer
  fi
fi
