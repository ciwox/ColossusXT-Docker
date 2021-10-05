FROM ubuntu:20.04
LABEL maintainer="Ciwox ColossusXT <ciwox@colossusxt.io>"

ENV LANG en_US.UTF-8
ENV TIMEZONE Europe/Brussels
ENV DEBIAN_FRONTEND noninteractive

ENV COLX_VERSION=1.2.4
ENV COLX_DATA=/home/colossusxt/.ColossusXT
ENV PATH=/opt/colx-${COLX_VERSION}/bin:$PATH
ENV COLX_CONF=/home/colossusxt/.ColossusXT/ColossusXT.conf

RUN apt update && apt -y dist-upgrade && \
    apt -y install locales ca-certificates --no-install-recommends --no-install-suggests && \
    locale-gen en_US en_US.UTF-8 && dpkg-reconfigure locales && update-ca-certificates && \
    apt -y install lsb-release wget gnupg2 curl \
    apt-transport-https sudo  \
    --no-install-recommends --no-install-suggests && \
    useradd -r colossusxt && apt -y autoremove && apt clean && rm -rf /var/lib/apt/lists/*

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
