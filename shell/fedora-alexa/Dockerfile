ARG FROM_TAG=master
FROM chaossystems/fedora-devtools:$FROM_TAG
MAINTAINER Greg Orzell <chaos@chaossystems.io>

# Alexa/AWS Tools
RUN pip install --upgrade pip && \
    pip install \
    setuptools \
    aws-mfa \
    awscli && \
    #npm install -g aws-sam-local && \
    npm install -g ask-cli

CMD ["/usr/bin/tmux"]
