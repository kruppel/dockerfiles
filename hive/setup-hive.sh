#!/usr/bin/env bash

cat << EOF > /opt/hive/conf/hive-site.xml
<configuration>
  <!-- Metadata Store -->
  <property>
    <name>javax.jdo.option.ConnectionURL</name>
    <value>jdbc:$MYSQL_URL</value>
  </property>
  <property>
    <name>javax.jdo.option.ConnectionDriverName</name>
    <value>com.mysql.jdbc.Driver</value>
  </property>
  <property>
    <name>javax.jdo.option.ConnectionUserName</name>
    <value>$MYSQL_USERNAME</value>
  </property>
  <property>
    <name>javax.jdo.option.ConnectionPassword</name>
    <value>$MYSQL_PASSWORD</value>
  </property>

  <!-- Google Cloud Storage -->
  <property>
    <name>fs.AbstractFileSystem.gs.impl</name>
    <value>com.google.cloud.hadoop.fs.gcs.GoogleHadoopFS</value>
  </property>
  <property>
    <name>fs.gs.impl</name>
    <value>com.google.cloud.hadoop.fs.gcs.GoogleHadoopFileSystem</value>
  </property>
  <property>
    <name>fs.gs.project.id</name>
    <value>$GCLOUD_PROJECT_ID</value>
  </property>
  <property>
    <name>fs.gs.system.bucket</name>
    <value>$GCLOUD_BUCKET</value>
  </property>

  <property>
    <name>hive.support.concurrency</name>
    <value>true</value>
  </property>
  <property>
    <name>datanucleus.autoCreateSchema</name>
    <value>true</value>
  </property>
  <property>
    <name>datanucleus.autoCreateTables</name>
    <value>true</value>
  </property>
  <property>
    <name>hive.metastore.schema.verification</name>
    <value>false</value>
  </property>
  <property>
    <name>dfs.permissions</name>
    <value>false</value>
  </property>
  <property>
    <name>hive.security.authorization.enabled</name>
    <value>false</value>
  </property>
  <property>
    <name>hive.security.authorization.createtable.owner.grants</name>
    <value>ALL</value>
  </property>
  <property>
    <name>hive.security.metastore.authorization.enabled</name>
    <value>false</value>
  </property>
</configuration>
EOF

cat /opt/hive/conf/hive-site.xml
echo "Configured Hive metastore"
