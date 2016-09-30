FROM        jetty:alpine
MAINTAINER  Michael B. Klein <michael.klein@northwestern.edu>
ENV         SOLR_VERSION 4.2.1
ENV         SOLR solr-${SOLR_VERSION}
ENV         SOLR_HOME ${JETTY_BASE}/solr
ARG         AVALON_BRANCH=master

ADD         http://archive.apache.org/dist/lucene/solr/${SOLR_VERSION}/${SOLR}.tgz /tmp/${SOLR}.tgz
RUN         cd /tmp && tar xzf ${SOLR}.tgz
RUN         mkdir -p ${SOLR_HOME}/avalon ${SOLR_HOME}/lib/contrib
RUN         cp /tmp/${SOLR}/dist/${SOLR}.war ${JETTY_BASE}/webapps/solr.war
RUN         cp /tmp/${SOLR}/dist/solr-analysis-extras-${SOLR_VERSION}.jar ${SOLR_HOME}/lib/
RUN         cp -r /tmp/${SOLR}/contrib/analysis-extras ${SOLR_HOME}/lib/contrib/
ADD         solr.xml ${SOLR_HOME}
ADD         solr-context.xml ${JETTY_BASE}/contexts
RUN         rm -rf /tmp/${SOLR}*
ADD         https://raw.githubusercontent.com/avalonmediasystem/avalon/${AVALON_BRANCH}/solr_conf/conf/schema.xml ${SOLR_HOME}/avalon/conf/schema.xml
ADD         https://raw.githubusercontent.com/avalonmediasystem/avalon/${AVALON_BRANCH}/solr_conf/conf/solrconfig.xml ${SOLR_HOME}/avalon/conf/solrconfig.xml
RUN         chown -R jetty:jetty ${JETTY_BASE}
