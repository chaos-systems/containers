ARG FROM_TAG=master
FROM chaossystems/fedora-cloudtools-onbuild:$FROM_TAG

ARG USER=root
ARG HOME=/root

WORKDIR $HOME

RUN dnf makecache && \
    dnf install -y \
    mutt \
    irssi && \
    dnf clean all

USER $USER:$USER

COPY vimrc .vimrc

RUN git clone https://github.com/VundleVim/Vundle.vim.git .vim/bundle/Vundle.vim && \
    vim +PluginInstall +qall

CMD ["/usr/bin/tmux"]
