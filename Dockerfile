FROM debian:jessie

MAINTAINER Niclas Mietz <docker@mietz.io>

ENV DEBIAN_FRONTEND noninteractive
ENV TS_VERSION 3.0.11.2

RUN apt-get update && apt-get install wget -y
RUN wget "http://dl.4players.de/ts/releases/$TS_VERSION/teamspeak3-server_linux-amd64-$TS_VERSION.tar.gz" \
    -O teamspeak3-server_linux-amd64-$TS_VERSION.tar.gz \
    ; tar -zxf teamspeak3-server_linux-amd64-${TS_VERSION}.tar.gz \
    ; mv teamspeak3-server_linux-amd64/tsdns /opt/tsdns \
    ; rm teamspeak3-server_linux-amd64-${TS_VERSION}.tar.gz && rm -r teamspeak3-server_linux-amd64 \
    ; apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /opt/tsdns

ENTRYPOINT ["./tsdnsserver_linux_amd64"]

EXPOSE 41144/tcp
