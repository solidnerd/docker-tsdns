FROM ubuntu:14.04

MAINTAINER Niclas Mietz <docker@mietz.io>

ENV DEBIAN_FRONTEND noninteractive
ENV TS_VERSION 3.0.11.2

RUN apt-get update && apt-get install wget vim -y
RUN wget "http://dl.4players.de/ts/releases/$TS_VERSION/teamspeak3-server_linux-amd64-$TS_VERSION.tar.gz" \
    -O teamspeak3-server_linux-amd64-$TS_VERSION.tar.gz \
    ; tar -zxf teamspeak3-server_linux-amd64-${TS_VERSION}.tar.gz \
    ; mv teamspeak3-server_linux-amd64 /opt/teamspeak \
    ; rm teamspeak3-server_linux-amd64-${TS_VERSION}.tar.gz

WORKDIR /opt/teamspeak/tsdns

RUN mv tsdns_settings.ini.sample tsdns_settings.ini

ENTRYPOINT ["./tsdnsserver_linux_amd64"]

EXPOSE 41144/tcp
