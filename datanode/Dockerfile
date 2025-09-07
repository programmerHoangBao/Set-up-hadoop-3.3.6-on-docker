FROM my-hadoop:latest
LABEL maintainer="Hoang Bao <universitynhb@gmail.com>"

# Healthcheck for datanode
HEALTHCHECK CMD curl -f http://localhost:9864/ || exit 1

# Configure DataNode directory
ENV HDFS_CONF_dfs_datanode_data_dir=file:///hadoop/dfs/data

RUN mkdir -p /hadoop/dfs/data
VOLUME /hadoop/dfs/data

# Copy script to start DataNode
ADD datanode/run.sh /run.sh
RUN chmod a+x /run.sh

# Web UI port for DataNode
EXPOSE 9864

CMD ["/run.sh"]
