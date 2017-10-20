FROM fedora:26
MAINTAINER Greg Orzell <chaos@chaossystems.io>

ARG SCALA_VERSION=2.12.2

# Base Packages
RUN curl -Ls https://bintray.com/sbt/rpm/rpm | tee /etc/yum.repos.d/bintray-sbt-rpm.repo && \
    dnf makecache && \
    dnf install -y \
    # Tools
    fish tmux make vim traceroute wget curl \
    # Development tools sbt
    git java-1.8.0-openjdk-devel sbt python python-pip ruby nodejs && \
    curl -LsO https://downloads.lightbend.com/scala/$SCALA_VERSION/scala-$SCALA_VERSION.rpm && \
    dnf install -y scala-$SCALA_VERSION.rpm && \
    sbt update && \
    dnf clean all

CMD ["/usr/bin/tmux"]
