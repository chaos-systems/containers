FROM ubuntu:17.04
MAINTAINER Greg Orzell <chaos@chaossystems.io>

# https://swift.org/builds/swift-3.0-preview-4/ubuntu1404/swift-3.0-PREVIEW-4/swift-3.0-PREVIEW-4-ubuntu14.04.tar.gz
ENV SWIFT_BRANCH=swift-3.1-release \
    SWIFT_VERSION=3.1-RELEASE \
    SWIFT_PLATFORM=ubuntu16.10
ENV SWIFT_ARCHIVE_NAME=swift-${SWIFT_VERSION}-${SWIFT_PLATFORM}.tar.gz

# Install related packages
RUN apt-get update -y && \
    apt-get install -y wget curl clang libicu-dev python2.7-dev libxml2 dirmngr libcurl3 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install Swift
RUN wget -q -O - https://swift.org/keys/all-keys.asc | gpg --import - && \
    gpg --keyserver hkp://pool.sks-keyservers.net --refresh-keys Swift && \
    SWIFT_URL=https://swift.org/builds/$SWIFT_BRANCH/$(echo "$SWIFT_PLATFORM" | tr -d .)/swift-$SWIFT_VERSION/$SWIFT_ARCHIVE_NAME && \
    echo $SWIFT_URL && \
    curl -Lso $SWIFT_ARCHIVE_NAME $SWIFT_URL && \
    curl -Lso $SWIFT_ARCHIVE_NAME.sig $SWIFT_URL.sig && \
    gpg --verify $SWIFT_ARCHIVE_NAME.sig && \
    tar -xvzf $SWIFT_ARCHIVE_NAME --directory / --strip-components=1 && \
    rm -rf $SWIFT_ARCHIVE_NAME* /tmp/* /var/tmp/*

# Set Swift Path
ENV PATH /usr/bin:$PATH

CMD ["/usr/bin/swift"]
