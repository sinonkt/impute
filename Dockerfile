# MAINTAINER oatkrittin@gmail.com
FROM ubuntu:16.04

# Installation instructions: https://mathgen.stats.ox.ac.uk/impute/impute_v2.html#download

ENV IMPUTE_HOME        /usr/local/impute
ENV IMPUTE_VERSION     v2.3.2
ENV PATH               $IMPUTE_HOME:$PATH

ENV TAR_GZ_FILE        impute_${IMPUTE_VERSION}_x86_64_static.tgz

RUN apt-get update && \
    apt-get install -y unzip wget && \
    wget https://mathgen.stats.ox.ac.uk/impute/$TAR_GZ_FILE && \
    mkdir -p $IMPUTE_HOME && \
    tar -zxvf $TAR_GZ_FILE && \
    mv impute_*/* $IMPUTE_HOME/. && \
    rm -f $TAR_GZ_FILE && \
    DEBIAN_FRONTEND=noninteractive apt-get autoremove -y unzip wget && \
    rm -rf /var/lib/apt/lists/*

# Clean data inside ./example
RUN rm -rf $IMPUTE_HOME/Example
