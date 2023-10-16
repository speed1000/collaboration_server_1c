# Сервер взаимодействия 1С 8.3
#https://its.1c.ru/db/v8311doc/content/232/hdoc
#https://its.1c.ru/db/metod8dev/content/5988/hdoc

FROM ubuntu:22.04

COPY 1c_cs_24.0.29_linux_x86_64.tar.gz /tmp

RUN cd /tmp \
    && apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        sudo \
        curl \
        nano \
        mc \
        wget \
        gawk \
        net-tools \
        openjdk-11-jdk \
    && rm -rf /var/lib/apt/lists/*

ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64
ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/lib/jvm/java-11-openjdk-amd64/bin:/opt/1C/1CE/components/1c-enterprise-ring-0.19.5+12-x86_64/

RUN cd /tmp \
    && tar xzf 1c_cs_24.0.29_linux_x86_64.tar.gz \
    && ./1ce-installer-cli install --ignore-signature-warnings \
	&& rm -rf * 

WORKDIR /app

COPY start.sh .
COPY init.sh .

RUN mv /bin/pidof /bin/_pidof && cp /bin/echo /bin/pidof \
    && chmod 777 *.sh \
    && ./init.sh