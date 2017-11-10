ARG FROM_TAG=master
FROM chaossystems/fedora-devtools:$FROM_TAG
MAINTAINER Greg Orzell <chaos@chaossystems.io>

# Update YUM with Cloud SDK repo information:
COPY google-cloud-sdk.repo /etc/yum.repos.d/google-cloud-sdk.repo

# Cloud Tools
RUN pip install --upgrade pip && \
    pip install setuptools && \
    pip install aws-mfa awscli && \
    #npm install -g aws-sam-local && \
    curl -Lso /usr/local/bin/ecs-cli https://s3.amazonaws.com/amazon-ecs-cli/ecs-cli-linux-amd64-latest && \
    chmod +x /usr/local/bin/ecs-cli && \
    # Install the Cloud SDK
    #dnf install -y google-cloud-sdk && \
    dnf clean all

CMD ["/usr/bin/tmux"]
