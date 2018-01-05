FROM java:openjdk-8

MAINTAINER Kurt Ruppel <me@kurtruppel.com>

ARG SPARK_HOME=/opt/spark
ARG SPARK_VERSION=2.2.1
ARG HADOOP_VERSION=2.7

ENV SPARK_HOME $SPARK_HOME

RUN wget -q -O - http://www-us.apache.org/dist/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz | tar -xzf - -C /opt
RUN mv /opt/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION} $SPARK_HOME

WORKDIR $SPARK_HOME

ADD docker-entrypoint.sh .

EXPOSE 6066 7077 8080 8081

ENTRYPOINT ["/opt/spark/docker-entrypoint.sh"]
