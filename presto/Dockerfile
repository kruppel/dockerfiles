FROM java:8-jdk-alpine
MAINTAINER Kurt Ruppel <me@kurtruppel.com>

EXPOSE 8080 8443

ARG VERSION=0.180

RUN apk add --update openssl python tar

RUN wget https://repo.maven.apache.org/maven2/com/facebook/presto/presto-server/$VERSION/presto-server-$VERSION.tar.gz -O /tmp/presto.tar.gz
RUN mkdir -p /opt && \
  tar xvzf /tmp/presto.tar.gz -C /tmp && \
  mv /tmp/presto-server-$VERSION /opt/presto && \
  rm /tmp/presto.tar.gz

WORKDIR /opt/presto

ENTRYPOINT ["/opt/presto/bin/launcher", "run"]
