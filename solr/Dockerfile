FROM        solr:6.1.0-alpine
MAINTAINER  Michael B. Klein <michael.klein@northwestern.edu>
ARG         AVALON_BRANCH=develop
ADD         https://raw.githubusercontent.com/samvera-labs/avalon-bundle/${AVALON_BRANCH}/solr/config/schema.xml avalon_conf/
ADD         https://raw.githubusercontent.com/samvera-labs/avalon-bundle/${AVALON_BRANCH}/solr/config/solrconfig.xml avalon_conf/
USER        root
RUN         /bin/chown -R solr:solr avalon_conf
