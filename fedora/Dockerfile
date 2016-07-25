FROM jetty:alpine
ARG  FEDORA_VERSION=3.8.1
ARG  FEDORA_DB_PASSWORD
ADD  fedora_home/ ${JETTY_BASE}/fedora/
ADD  https://github.com/projecthydra/hydra-jetty/raw/7.x-stable/webapps/fedora.war ${JETTY_BASE}/fedora/
ADD  etc/ ${JETTY_BASE}/etc/
ADD  fedora.xml ${JETTY_BASE}/webapps/fedora.xml
RUN  /bin/chown -R jetty:jetty ${JETTY_BASE}/fedora/ ${JETTY_BASE}/etc/
RUN  /bin/echo etc/jetty-fedorarealm.xml > ${JETTY_BASE}/start.ini
ADD  fedora-entrypoint.sh /
ENTRYPOINT ["/fedora-entrypoint.sh"]
