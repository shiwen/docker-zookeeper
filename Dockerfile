FROM shiwen/java

MAINTAINER shiwen

COPY cloudera.list /etc/apt/sources.list.d/

RUN apt-get update && \
    apt-get install -y --force-yes \
    zookeeper=3.4.5+26-1.cdh4.7.0.p0.17~precise-cdh4.7.0 \
    zookeeper-server=3.4.5+26-1.cdh4.7.0.p0.17~precise-cdh4.7.0
RUN service zookeeper-server init --myid=1

EXPOSE 2181 2888 3888

VOLUME ["/var/lib/zookeeper", "/var/log/zookeeper"]

CMD ["/usr/lib/zookeeper/bin/zkServer.sh", "start-foreground"]
