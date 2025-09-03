FROM my-hadoop:latest

LABEL maintainer="Hoang Bao <universitynhb@gmail.com>"

COPY submit/WordCount.jar /opt/hadoop/applications/WordCount.jar

ENV JAR_FILEPATH="/opt/hadoop/applications/WordCount.jar"
ENV CLASS_TO_RUN="WordCount"
ENV PARAMS="/input /output"

ADD submit/run.sh /run.sh
RUN chmod a+x /run.sh

CMD ["/run.sh"]
