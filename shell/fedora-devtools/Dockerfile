FROM fedora:26
MAINTAINER Greg Orzell <chaos@chaossystems.io>

ARG SCALA_VERSION=2.12.4
ARG USER=root
ARG HOME=/root

# Base Packages
RUN dnf makecache && \
    dnf install -y \
    # Tools
    curl \
    fish \
    fzf \
    hostname \
    make \
    sudo \
    the_silver_searcher \
    tmux \
    traceroute \
    vim \
    wget \
    # Development tools sbt
    git \
    java-1.8.0-openjdk-devel \
    python \
    python-pip \
    ruby \
    nodejs && \
    dnf clean all

# Scala Tools
RUN curl -Lso /etc/yum.repos.d/bintray-sbt-rpm.repo https://bintray.com/sbt/rpm/rpm && \
    curl -LsO https://downloads.lightbend.com/scala/$SCALA_VERSION/scala-$SCALA_VERSION.rpm && \
    dnf install -y \
    sbt \
    scala-$SCALA_VERSION.rpm && \
    sbt update && \
    curl -Lso /usr/local/bin/amm https://github.com/lihaoyi/Ammonite/releases/download/1.0.3/2.12-1.0.3 && \
    chmod +x /usr/local/bin/amm && \
    dnf clean all

RUN if [ "$USER" != "root" ]; then \
    useradd -ms /usr/bin/fish $USER; \
    usermod $USER -a -G wheel; \
    sed -i 's/# %wheel/%wheel/' /etc/sudoers; \
    fi

USER $USER:$USER
WORKDIR $HOME
CMD ["/usr/bin/tmux"]
