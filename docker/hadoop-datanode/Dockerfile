FROM express42/hadoop:2.8.0

ENV HDFS_CONF_dfs_datanode_data_dir=file:///hadoop/dfs/data
RUN mkdir -p /hadoop/dfs/data
VOLUME /hadoop/dfs/data

COPY run.sh /run.sh
RUN chmod a+x /run.sh

CMD ["/run.sh"]
