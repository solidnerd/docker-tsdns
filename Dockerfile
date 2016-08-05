FROM debian:jessie

MAINTAINER Niclas Mietz <github@mietz.io>

ENV DEBIAN_FRONTEND noninteractive

ENV TS_VERSION 3.0.13

ENV   TS_VERSION 3.0.13
ENV   TS_FILENAME teamspeak3-server_linux_amd64
ENV   TSDNS_HOME /opt/tsdns


RUN apt-get update && apt-get install wget mysql-common bzip2 -y \
      && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
      && wget "http://dl.4players.de/ts/releases/${TS_VERSION}/${TS_FILENAME}-${TS_VERSION}.tar.bz2" -O ${TS_FILENAME}-${TS_VERSION}.tar.bz2 \
      && tar -xjf "${TS_FILENAME}-${TS_VERSION}.tar.bz2" \
      && rm ${TS_FILENAME}-${TS_VERSION}.tar.bz2 \
      && mv ${TS_FILENAME}/tsdns ${TSDNS_HOME} \
      && rm -r ${TS_FILENAME} \
      && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR ${TSDNS_HOME}

ENTRYPOINT ["./tsdnsserver"]

EXPOSE 41144/tcp
