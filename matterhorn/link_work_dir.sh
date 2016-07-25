#!/bin/bash
if [ ! -d /usr/local/matterhorn/work ]; then
  chmod 0777 /streamfiles
  mkdir -p /work/work
  chown matterhorn:matterhorn /work/work
  su -c "ln -s /work/work /usr/local/matterhorn/work" matterhorn
fi
