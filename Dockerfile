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
ADD install.sh /install.sh
RUN chmod 755 /install.sh

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

WORKDIR /app
RUN /install.sh

# Run Polyglot
CMD /run.sh
