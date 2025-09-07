FROM my-hadoop:latest

LABEL maintainer="Hoang Bao <universitynhb@gmail.com>"

HEALTHCHECK CMD curl -f http://localhost:8088/ || exit 1

ADD resourcemanager/run.sh /run.sh
RUN chmod a+x /run.sh

EXPOSE 8088

CMD ["/run.sh"]
