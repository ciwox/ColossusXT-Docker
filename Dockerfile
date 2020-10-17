FROM ubuntu:18.04

LABEL maintainer.0="ColossusXT Core Team (@colossuscoinxt)"

ENV COLX_VERSION=1.2.4
ENV COLX_DATA=/home/colossusxt/.ColossusXT
ENV PATH=/opt/colx-${COLX_VERSION}/bin:$PATH
ENV COLX_CONF=/home/colossusxt/.ColossusXT/ColossusXT.conf

RUN useradd -r colossusxt \
	&& apt-get update && apt-get install -y software-properties-common \
	&& apt-add-repository -y ppa:bitcoin/bitcoin && apt-get update \
	&& apt-get install -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" make software-properties-common \
	build-essential libtool autoconf libssl-dev libboost-dev libboost-chrono-dev libboost-filesystem-dev libboost-program-options-dev \
	libboost-system-dev libboost-test-dev libboost-thread-dev sudo automake git wget curl libdb4.8-dev bsdmainutils libdb4.8++-dev \
	libminiupnpc-dev libgmp3-dev ufw pkg-config libevent-dev


RUN curl -SLO https://github.com/ColossusCoinXT/ColossusCoinXT/releases/download/v${COLX_VERSION}/colx-${COLX_VERSION}-x86_64-linux-gnu.tar.gz \
	&& tar -xzf colx-${COLX_VERSION}-x86_64-linux-gnu.tar.gz -C /opt \
	&& rm *.tar.gz \
	&& ln -s /opt/colx-1.2.4/bin/colxd /usr/bin/ \
	&& ln -s /opt/colx-1.2.4/bin/colx-cli /usr/bin/ \
	&& ln -s /opt/colx-1.2.4/bin/colx-qt /usr/bin/ \
	&& ln -s /opt/colx-1.2.4/bin/colx-tx /usr/bin/

VOLUME ["/home/colossusxt/.ColossusXT"]
EXPOSE 51572 51573
WORKDIR /home/colossusxt

CMD ["colxd", "-datadir=/home/colossusxt/.ColossusXT/"]	