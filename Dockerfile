FROM phusion/baseimage:0.11
MAINTAINER polyglot-docker@timekiller.org

# Version
ENV version 1.0

# Set correct environment variables
ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

ADD run.sh /run.sh
RUN chmod 755 /run.sh

RUN mkdir -p /data/db
RUN apt-get update && \
  apt-get install -y apt-utils && \
  apt-get upgrade -y -o Dpkg::Options::="--force-confold" && \
  apt-get install -qqy  \
    git \
    python3-pip \
    python3-dev \
    python2.7-dev \
    python-pip \
    mongodb \
    wget

# 80 = HTTP, 443 = HTTPS, 3000 = Express server(dev), 4200 = Angular2 (dev)
EXPOSE 3000

RUN mkdir -p /app
WORKDIR /app
RUN wget -q https://github.com/Einstein42/udi-polyglotv2/raw/master/binaries/polyglot-v2-linux-x64.tar.gz
RUN tar -zxf /app/polyglot-v2-linux-x64.tar.gz

# Run Polyglot
CMD /run.sh
