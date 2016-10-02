#!/bin/bash
chmod 0777 /masterfiles
cd /home/app/avalon
RAILS_ENV=production su -m -c "bundle exec rake db:migrate assets:rewrite_asset_host" app
cd public/assets/mediaelement_rails
if [ ! -e flashmediaelement.swf ]; then
  ln -s flashmediaelement-*.swf flashmediaelement.swf
fi
