FROM chaossystems/swift:3

WORKDIR /clion

RUN apt-get update && \
    apt-get install -y --no-install-recommends git openjdk-8-jdk && \
    apt-get clean && \
    curl -LsO https://download.jetbrains.com/cpp/CLion-2017.1.2.tar.gz && \
    tar -zxvf CLion-*.tar.gz && \
    mv clion-*/* . && \
    rm -rf clion-*

CMD ["/clion/bin/clion.sh"]
