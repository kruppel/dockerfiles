#!/usr/bin/env bash

if [ -z "${SPARK_MASTER}" ]
then
  : ${MASTER_HOST:="spark-master"}
  : ${MASTER_PORT:=7077}
  : ${WEBUI_PORT:=8081}

  CLASS="org.apache.spark.deploy.worker.Worker"
  FLAGS="${CLASS} spark://${MASTER_HOST}:${MASTER_PORT} --webui-port $WEBUI_PORT"
  echo $FLAGS
else
  echo "$(hostname -i) spark-master" >> /etc/hosts

  : ${PORT:=7077}
  : ${WEBUI_PORT:=8080}

  CLASS="org.apache.spark.deploy.master.Master"
  FLAGS="${CLASS} --ip spark-master --port ${PORT} --webui-port $WEBUI_PORT"
fi

$SPARK_HOME/bin/spark-class $FLAGS
