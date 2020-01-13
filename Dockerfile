FROM ubuntu:xenial

RUN apt-get update && apt-get install -y --no-install-recommends \
        software-properties-common
RUN add-apt-repository -y ppa:bitcoin-abc/ppa

RUN apt-get update && apt-get install -y --no-install-recommends \
                bitcoind=0.20.10-uahf-xenial1 \
        && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 8332 8333 18332 18333 28332 28333

WORKDIR /bitcoin
ENV HOME /bitcoin
VOLUME ["/bitcoin"]
