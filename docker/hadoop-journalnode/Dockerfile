FROM express42/hadoop:2.8.0

RUN mkdir -p /hadoop/dfs/journal
VOLUME /hadoop/dfs/journal

ADD run.sh /run.sh
RUN chmod a+x /run.sh

CMD ["/run.sh"]
