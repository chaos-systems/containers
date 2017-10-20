FROM chaossystems/fedora-devtools:master
MAINTAINER Greg Orzell <chaos@chaossystems.io>

# Update YUM with Cloud SDK repo information:
COPY google-cloud-sdk.repo /etc/yum.repos.d/google-cloud-sdk.repo

# Cloud Tools
RUN pip install --upgrade pip && \
    pip install setuptools && \
    pip install awscli && \
    # Install the Cloud SDK
    dnf makecache && \
    dnf install -y google-cloud-sdk && \
    dnf clean all

CMD ["/usr/bin/tmux"]
