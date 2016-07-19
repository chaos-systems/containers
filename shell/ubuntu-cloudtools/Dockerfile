FROM chaossystems/ubuntu-devtools:master
MAINTAINER Greg Orzell <chaos@chaossystems.io>

# Cloud Tools
RUN pip install --upgrade pip && \
    pip install setuptools && \
    pip install awscli && \
    export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)" && \
    echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | tee /etc/apt/sources.list.d/google-cloud-sdk.list && \
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - && \
    apt-get update && apt-get install google-cloud-sdk -y && \
    apt-get clean

ENTRYPOINT ["/usr/bin/fish"]
