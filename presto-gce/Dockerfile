FROM kruppel/presto
MAINTAINER Kurt Ruppel <me@kurtruppel.com>

RUN wget https://storage.googleapis.com/hadoop-lib/gcs/gcs-connector-latest-hadoop2.jar
RUN mv gcs-connector-latest-hadoop2.jar /opt/presto/plugin/hive-hadoop2/gcs-connector-latest-hadoop2.jar

COPY ./bin/* /opt/presto/bin/
COPY ./config/core.xml /opt/presto/etc/core.xml

ENTRYPOINT ["/opt/presto/bin/launcher-gce", "run"]
