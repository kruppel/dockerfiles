FROM java:8-jdk
MAINTAINER Kurt Ruppel <me@kurtruppel.com>

EXPOSE 8080 8081 8443

ARG VERSION=0.180

RUN wget https://repo.maven.apache.org/maven2/com/facebook/presto/presto-server/$VERSION/presto-server-$VERSION.tar.gz -O /tmp/presto.tar.gz

RUN mkdir -p /opt && \
  tar xvzf /tmp/presto.tar.gz -C /tmp && \
  mv /tmp/presto-server-$VERSION /opt/presto && \
  rm /tmp/presto.tar.gz

RUN mkdir -p /opt/presto/etc/catalog

COPY ./bin/* /opt/presto/bin/
COPY ./catalog/* /opt/presto/etc/catalog/
COPY ./config/common/* /opt/presto/etc/

WORKDIR /opt/presto

ENTRYPOINT ["/opt/presto/bin/launcher", "run"]
