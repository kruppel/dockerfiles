FROM java:8-jdk
MAINTAINER Kurt Ruppel <me@kurtruppel.com>

EXPOSE 8080 8081 8443

ARG VERSION=0.180

RUN wget https://repo.maven.apache.org/maven2/com/facebook/presto/presto-server/$VERSION/presto-server-$VERSION.tar.gz -O /tmp/presto.tar.gz
RUN mkdir -p /opt && \
  tar xvzf /tmp/presto.tar.gz -C /tmp && \
  mv /tmp/presto-server-$VERSION /opt/presto && \
  rm /tmp/presto.tar.gz

RUN mkdir -p /opt/presto/etc
COPY ./config/common/* /opt/presto/etc/
RUN sed -i "s/\$(uuid-generated-nodeid)/$(cat /proc/sys/kernel/random/uuid)/g" /opt/presto/etc/node.properties

WORKDIR /opt/presto

ENTRYPOINT ["/opt/presto/bin/launcher", "run"]
