FROM bde2020/hadoop-base:1.0.0-hadoop2.7.1

ENV HIVE_VERSION 2.1.1
ENV HIVE_HOME /opt/hive
ENV PATH $HIVE_HOME/bin:$PATH
ENV HADOOP_HOME /opt/hadoop-$HADOOP_VERSION
RUN cp /opt/hadoop-$HADOOP_VERSION/share/hadoop/tools/lib/*aws*.jar /opt/hadoop-$HADOOP_VERSION/share/hadoop/common/lib/

WORKDIR /opt
RUN apt-get update && apt-get install -y wget procps libmysql-java && \
    wget http://www.apache.org/dist/hive/hive-$HIVE_VERSION/apache-hive-$HIVE_VERSION-bin.tar.gz && \
    tar -xzvf apache-hive-$HIVE_VERSION-bin.tar.gz && \
    mv apache-hive-$HIVE_VERSION-bin hive && \
    ln -s /usr/share/java/mysql-connector-java.jar $HIVE_HOME/lib/mysql-connector-java.jar && \
    wget https://storage.googleapis.com/hadoop-lib/gcs/gcs-connector-latest-hadoop2.jar && \
    mv gcs-connector-latest-hadoop2.jar $HIVE_HOME/lib/gcs-connector-latest-hadoop2.jar && \
    rm apache-hive-$HIVE_VERSION-bin.tar.gz && \
    apt-get --purge remove -y wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /
ADD . /
ENTRYPOINT ["/docker-entrypoint.sh"]
