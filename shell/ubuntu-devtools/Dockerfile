FROM ubuntu:17.10
MAINTAINER Greg Orzell <chaos@chaossystems.io>

# Base Packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    # Tools
    fish tmux lsb-release apt-utils vim traceroute wget curl \
    # Development tools sbt
    git openjdk-9-jdk scala groovy gradle python python-pip ruby && \
    apt-get clean

CMD ["/usr/bin/tmux"]
