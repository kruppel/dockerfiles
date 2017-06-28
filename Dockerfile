FROM java:8-jdk-alpine
MAINTAINER Kurt Ruppel <me@kurtruppel.com>

EXPOSE 8080 8443

ARG VERSION=0.179

ADD https://repo.maven.apache.org/maven2/com/facebook/presto/presto-server/$VERSION/presto-server-$VERSION.tar.gz /tmp/presto.tar.gz
RUN tar xvzf /tmp/presto.tar.gz &&
  mv /tmp/presto-server-$VERSION /opt/presto &&
  rm /tmp/presto.tar.gz

RUN apk add --update python

ENTRYPOINT ["/opt/presto/bin/launcher", "run"]
