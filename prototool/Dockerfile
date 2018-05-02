FROM debian:stable-slim

ARG VERSION=0.1.0

RUN apt-get update && \
    apt-get install --no-install-recommends -y ca-certificates curl && \
    curl -sSL https://github.com/uber/prototool/releases/download/v$VERSION/prototool-$(uname -s)-$(uname -m) -o /usr/local/bin/prototool && \
    chmod +x /usr/local/bin/prototool && \
    apt-get remove -y ca-certificates curl && \
    apt-get clean -y && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/usr/local/bin/prototool"]
