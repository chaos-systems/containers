ARG FROM_IMAGE=null
ARG FROM_TAG=master
FROM $FROM_IMAGE:$FROM_TAG
MAINTAINER Greg Orzell <chaos@chaossystems.io>

ONBUILD ARG USER=root

ONBUILD RUN if [ "$USER" != "root" ]; then \
    useradd -ms /usr/bin/fish $USER; \
    usermod $USER -a -G wheel; \
    sed -i 's/# %wheel/%wheel/' /etc/sudoers; \
    fi

