#!/bin/bash
chmod 0777 /masterfiles
chown -R app /masterfiles
cd /home/app/avalon
cd public/assets/mediaelement_rails
if [ ! -e flashmediaelement.swf ]; then
  ln -s flashmediaelement-*.swf flashmediaelement.swf
fi
