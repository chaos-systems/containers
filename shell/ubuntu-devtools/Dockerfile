FROM ubuntu:16.04
MAINTAINER Greg Orzell <chaos@chaossystems.io>

# Base Packages
RUN apt-get update && \
    apt-get dist-upgrade -y && \
    apt-get install -y --no-install-recommends \
    # Tools
    fish lsb-release apt-utils vim traceroute wget curl \
    # Development tools sbt
    git openjdk-8-jdk scala groovy gradle python python-pip ruby && \
    apt-get clean

ENTRYPOINT ["/usr/bin/fish"]
