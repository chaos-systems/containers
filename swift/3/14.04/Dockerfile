FROM ubuntu:14.04
MAINTAINER Greg Orzell <chaos@chaossystems.io>

# https://swift.org/builds/swift-3.0-preview-4/ubuntu1404/swift-3.0-PREVIEW-4/swift-3.0-PREVIEW-4-ubuntu14.04.tar.gz
ENV SWIFT_BRANCH swift-3.0-release
ENV SWIFT_VERSION 3.0.1-RELEASE
ENV SWIFT_PLATFORM ubuntu14.04

# Install related packages
RUN apt-get update && \
    apt-get dist-upgrade -y && \
    apt-get clean

RUN apt-get install -y build-essential wget clang libedit-dev python2.7-dev libxml2 libicu52 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install Swift keys
RUN wget -q -O - https://swift.org/keys/all-keys.asc | gpg --import - && \
    gpg --keyserver hkp://pool.sks-keyservers.net --refresh-keys Swift

# Install Swift Ubuntu 14.04 Snapshot
RUN SWIFT_ARCHIVE_NAME=swift-$SWIFT_VERSION-$SWIFT_PLATFORM && \
    SWIFT_URL=https://swift.org/builds/$SWIFT_BRANCH/$(echo "$SWIFT_PLATFORM" | tr -d .)/swift-$SWIFT_VERSION/$SWIFT_ARCHIVE_NAME.tar.gz && \
    wget $SWIFT_URL && \
    wget $SWIFT_URL.sig && \
    gpg --verify $SWIFT_ARCHIVE_NAME.tar.gz.sig && \
    tar -xvzf $SWIFT_ARCHIVE_NAME.tar.gz --directory / --strip-components=1 && \
    rm -rf $SWIFT_ARCHIVE_NAME* /tmp/* /var/tmp/*

# Set Swift Path
ENV PATH /usr/bin:$PATH

ENTRYPOINT ["/usr/bin/swift"]
