FROM ruby:2.4-alpine

ENV JAVA_HOME /usr/lib/jvm/java-1.8-openjdk
ENV JAVA_ALPINE_VERSION 8.111.14-r0

RUN apk add --update build-base openjdk8="$JAVA_ALPINE_VERSION" sqlite sqlite-dev sqlite-libs tar

ENV MAVEN_VERSION 3.3.9
RUN wget http://apache.osuosl.org/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz -O /tmp/maven.tar.gz
RUN mkdir -p /usr/share/maven && \
  tar xvzf /tmp/maven.tar.gz -C /usr/share/maven --strip-components=1 && \
  rm /tmp/maven.tar.gz
ENV MAVEN_HOME /usr/share/maven
ENV PATH ${MAVEN_HOME}/bin:${PATH}
