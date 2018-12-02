ARG FROM_IMAGE=ubuntu
ARG FROM_TAG=rolling
FROM $FROM_IMAGE:$FROM_TAG
MAINTAINER Greg Orzell <chaos@chaossystems.io>

RUN apt-get update && \
    apt-get install --no-install-recommends -y \
    openssh-server && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /root/.ssh /run/sshd

COPY sshd_config /etc/ssh/

EXPOSE 22
ENTRYPOINT ["/usr/sbin/sshd", "-D"] 
