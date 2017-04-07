#!/bin/bash

# Check and bootstrap zkfc
if $HADOOP_PREFIX/bin/hdfs --config $HADOOP_CONF_DIR zkfc -formatZK -nonInteractive; then
  echo "Skipping zkfc formatting, previous data are present"
else
  echo "Start zkfc instance"
  $HADOOP_PREFIX/bin/hdfs --config $HADOOP_CONF_DIR zkfc
fi
