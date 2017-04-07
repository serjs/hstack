FROM express42/hadoop:2.8.0


# Setup packages for fencing
RUN apt-get update && apt-get install -y --no-install-recommends openssh-server openssh-client rsync
RUN rm -rf /var/lib/apt/lists/* && rm -rf /var/lib/apt/archives/*

# Configure SSH for ssh-fencing
# passwordless ssh
RUN ssh-keygen -q -N "" -t rsa -f /root/.ssh/id_rsa
RUN cp /root/.ssh/id_rsa.pub /root/.ssh/authorized_keys

COPY ssh_config /root/.ssh/config
RUN chmod 600 /root/.ssh/config
RUN chown root:root /root/.ssh/config

# fix the 254 error code
RUN sed  -i "/^[^#]*UsePAM/ s/.*/#&/"  /etc/ssh/sshd_config
RUN echo "UsePAM no" >> /etc/ssh/sshd_config
RUN sed -i "s/Port\ 22/Port\ 2122/g" /etc/ssh/sshd_config


ENV HDFS_CONF_dfs_namenode_name_dir=file:///hadoop/dfs/name
RUN mkdir -p /hadoop/dfs/name
VOLUME /hadoop/dfs/name

COPY run.sh /run.sh
RUN chmod a+x /run.sh

CMD ["/run.sh"]
