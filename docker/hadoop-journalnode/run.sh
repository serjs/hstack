#!/bin/bash

if [ -z "$CLUSTER_NAME" ]; then
  echo "Cluster name not specified"
  exit 2
fi

$HADOOP_PREFIX/bin/hdfs --config $HADOOP_CONF_DIR journalnode
