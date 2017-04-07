#!/bin/bash

namedir=`echo $HDFS_CONF_dfs_namenode_name_dir | perl -pe 's#file://##'`
if [ ! -d $namedir ]; then
  echo "Namenode name directory not found: $namedir"
  exit 2
fi

if [ -z "$CLUSTER_NAME" ]; then
  echo "Cluster name not specified"
  exit 2
fi

if $NN_STANDBY; then
  echo "Formatting namenode name directory, trying to obtain Standby role: $namedir"
  $HADOOP_PREFIX/bin/hdfs --config $HADOOP_CONF_DIR namenode -bootstrapStandby -nonInteractive
fi

if [ "`ls -A $namedir`" == "" ]; then
  echo "Formatting namenode name directory: $namedir"
  $HADOOP_PREFIX/bin/hdfs --config $HADOOP_CONF_DIR namenode -format -nonInteractive $CLUSTER_NAME
fi

# We need it for ssh fencing
service ssh start

# Start namenode
$HADOOP_PREFIX/bin/hdfs --config $HADOOP_CONF_DIR namenode
