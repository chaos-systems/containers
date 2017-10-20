FROM chaossystems/fedora-devtools:master
MAINTAINER Greg Orzell <chaos@chaossystems.io>

# Alexa/AWS Tools
RUN pip install --upgrade pip && \
    pip install setuptools && \
    pip install aws-mfa awscli && \
    npm install -g ask-cli

CMD ["/usr/bin/tmux"]
