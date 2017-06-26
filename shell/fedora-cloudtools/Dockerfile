FROM chaossystems/ubuntu-devtools:master
MAINTAINER Greg Orzell <chaos@chaossystems.io>

# Cloud Tools
RUN pip install --upgrade pip && \
    pip install setuptools && \
    pip install awscli && \
    # Update YUM with Cloud SDK repo information:
    tee -a /etc/yum.repos.d/google-cloud-sdk.repo << EOM \
    [google-cloud-sdk] \
    name=Google Cloud SDK \
    baseurl=https://packages.cloud.google.com/yum/repos/cloud-sdk-el7-x86_64 \
    enabled=1 \
    gpgcheck=1 \
    repo_gpgcheck=1 \
    gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg \
           https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg \
    EOM && \
    # Install the Cloud SDK
    dnf makecache && \
    dnf install -y google-cloud-sdk && \
    dnf clean all

ENTRYPOINT ["/usr/bin/fish"]
