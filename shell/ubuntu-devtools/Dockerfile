FROM ubuntu:18.10
MAINTAINER Greg Orzell <chaos@chaossystems.io>

ARG SCALA_VERSION=2.12.7
ARG AMM_VERSION=1.3.2
ARG USER=root
ARG HOME=/root

# Base Packages
RUN apt-get update && \
    apt-get install -y ca-certificates gnupg2 lsb-release software-properties-common && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-key 379CE192D401AB61 && \
    apt-add-repository "deb https://dl.bintray.com/chaos-systems/deb $(lsb_release -cs) main" && \
    apt-get update && \
    apt-get install -y chaossystems-repos && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
    # Tools
    apt-utils \
    dirmngr \
    chaossystems-devtools && \
    apt-get clean -y && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*

# Scala Tools
RUN wget https://downloads.lightbend.com/scala/$SCALA_VERSION/scala-$SCALA_VERSION.deb && \
    apt-get install ./scala-$SCALA_VERSION.deb

RUN if [ "$USER" != "root" ]; then \
    useradd -ms /usr/bin/fish $USER; \
    usermod $USER -a -G wheel; \
    sed -i 's/# %wheel/%wheel/' /etc/sudoers; \
    fi

USER $USER:$USER
WORKDIR $HOME

CMD ["/usr/bin/tmux"]
