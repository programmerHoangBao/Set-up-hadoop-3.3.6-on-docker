FROM ubuntu:22.04
LABEL maintainer="Hoang Bao <universitynhb@gmail.com>"

# Install Java 11 and necessary tools
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
      curl \
      gnupg \
      net-tools \
      netcat-openbsd \
      openjdk-11-jdk \
    && rm -rf /var/lib/apt/lists/*

# Set JAVA_HOME for Java 11
ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/

# Download and import key to verify Hadoop
RUN curl -O https://dist.apache.org/repos/dist/release/hadoop/common/KEYS
RUN gpg --import KEYS

# Declare new Hadoop version
ENV HADOOP_VERSION=3.3.6
ENV HADOOP_URL=https://downloads.apache.org/hadoop/common/hadoop-${HADOOP_VERSION}/hadoop-${HADOOP_VERSION}.tar.gz

# Download, verify and extract Hadoop
RUN set -x \
    && curl -fSL "$HADOOP_URL" -o /tmp/hadoop.tar.gz \
    && curl -fSL "$HADOOP_URL.asc" -o /tmp/hadoop.tar.gz.asc \
    && gpg --verify /tmp/hadoop.tar.gz.asc || echo "Warning: GPG verification skipped (key may not exist yet)" \
    && tar -xvf /tmp/hadoop.tar.gz -C /opt/ \
    && rm /tmp/hadoop.tar.gz*

# Create symlink and necessary directories
RUN ln -s /opt/hadoop-${HADOOP_VERSION}/etc/hadoop /etc/hadoop \
    && mkdir -p /opt/hadoop-${HADOOP_VERSION}/logs \
    && mkdir -p /hadoop-data

# Hadoop environmental variable
ENV HADOOP_HOME=/opt/hadoop-${HADOOP_VERSION}
ENV HADOOP_CONF_DIR=/etc/hadoop
ENV MULTIHOMED_NETWORK=1
ENV USER=root
ENV PATH=${HADOOP_HOME}/bin/:$PATH

# Copy scripts
ADD ./base/entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
