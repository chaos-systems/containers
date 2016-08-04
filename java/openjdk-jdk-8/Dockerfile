FROM ubuntu:16.04
MAINTAINER Greg Orzell <chaos@chaossystems.io>

# Install Open JDK Java 8

RUN apt-get update && \
    apt-get dist-upgrade -y && \
    apt-get install -y --no-install-recommends openjdk-8-jdk && \
    apt-get clean 
