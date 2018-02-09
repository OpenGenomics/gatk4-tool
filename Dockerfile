FROM ubuntu:16.04

RUN apt-get update && \ 
    apt-get install -y build-essential git openjdk-8-jdk python wget

WORKDIR /opt

#Install GATK4
RUN wget https://github.com/broadinstitute/gatk/archive/4.0.1.2.tar.gz && \
    tar -zxvf 4.0.1.2.tar.gz && \
    cd gatk-4.0.1.2/ && \
    git init && \
    ./gradlew local

ENV PATH=/opt/gatk-4.0.1.2:$PATH
