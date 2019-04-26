FROM alpine:3.7

# Java    ?
# Python  2.7.12
# Hadoop  2.7.3-amzn-4
# Spark   2.2.0 - Using Scala version 2.11.8, OpenJDK 64-Bit Server VM, 1.8.0_141

RUN apk add openjdk8-jre-base \
    --update-cache \
    --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ \
    --allow-untrusted \
    && rm -rf /var/cache/apk/*

ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

RUN apk add --update python

RUN wget https://archive.apache.org/dist/hadoop/core/hadoop-2.7.3/hadoop-2.7.3.tar.gz
RUN tar -xvf hadoop-2.7.3.tar.gz -C usr/lib/

ENV HADOOP_HOME /usr/lib/hadoop-2.7.3

#CMD '/bin/bash'