FROM        solr:6.6.4-alpine
MAINTAINER  Michael B. Klein <michael.klein@northwestern.edu>
ARG         AVALON_BRANCH=develop
ADD         --chown=solr:solr https://raw.githubusercontent.com/avalonmediasystem/avalon/${AVALON_BRANCH}/solr/config/schema.xml avalon_conf/
ADD         --chown=solr:solr https://raw.githubusercontent.com/avalonmediasystem/avalon/${AVALON_BRANCH}/solr/config/solrconfig.xml avalon_conf/
