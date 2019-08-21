FROM        jetty:alpine
LABEL       maintainer="Michael B. Klein <michael.klein@northwestern.edu>, Phuong Dinh <pdinh@indiana.edu>"
ARG         FEDORA_VERSION=4.7.5
ADD         --chown=jetty:jetty fcrepo-webapp-${FEDORA_VERSION}.war ${JETTY_BASE}/fedora/fedora.war
ADD         --chown=jetty:jetty fedora.xml ${JETTY_BASE}/webapps/fedora.xml

USER        root
RUN         mkdir /data && chown -R jetty:jetty /data
VOLUME      /data
USER        jetty

EXPOSE      8080
