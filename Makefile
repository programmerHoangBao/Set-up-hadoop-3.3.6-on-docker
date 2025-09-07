DOCKER_NETWORK = docker-hadoop_default
ENV_FILE = hadoop.env
current_branch := $(shell git rev-parse --abbrev-ref HEAD)

HADOOP_VERSION = 3.3.6
BASE_IMAGE = hadoop-base:$(current_branch)

build:
	docker build -t $(BASE_IMAGE) ./base
	docker build -t hadoop-namenode:$(current_branch) ./namenode
	docker build -t hadoop-datanode:$(current_branch) ./datanode
	docker build -t hadoop-resourcemanager:$(current_branch) ./resourcemanager
	docker build -t hadoop-nodemanager:$(current_branch) ./nodemanager
	docker build -t hadoop-historyserver:$(current_branch) ./historyserver
	docker build -t hadoop-submit:$(current_branch) ./submit

wordcount:
	docker build -t hadoop-wordcount ./submit

	# Create input folders on HDFS
	docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} $(BASE_IMAGE) hdfs dfs -mkdir -p /input/
	
	# Copy file README.txt from Hadoop 3.3.6 to HDFS
	docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} $(BASE_IMAGE) hdfs dfs -copyFromLocal -f /opt/hadoop-$(HADOOP_VERSION)/README.txt /input/
	
	# Run WordCount job
	docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} hadoop-wordcount
	
	# Display results
	docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} $(BASE_IMAGE) hdfs dfs -cat /output/*
	
	# Delete results after running
	docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} $(BASE_IMAGE) hdfs dfs -rm -r /output
	docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} $(BASE_IMAGE) hdfs dfs -rm -r /input
