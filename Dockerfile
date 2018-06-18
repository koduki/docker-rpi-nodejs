FROM raspbian/stretch
#FROM arm32v7/debian
#FROM resin/rpi-raspbian:latest

MAINTAINER koduki

#RUN echo "deb http://ftp.jp.debian.org/debian unstable main contrib non-fre" >> /etc/apt/sources.list
#RUN echo "deb-src http://ftp.jp.debian.org/debian unstable main contrib non-free" >> /etc/apt/sources.list
RUN set -x && apt-get update -y
RUN set -x && apt-get install -y libraspberrypi-bin cec-utils

ADD https://deb.nodesource.com/setup_10.x setup.sh
#RUN set -x && apt-get update -y && apt-get install -y gnupg 
RUN bash ./setup.sh
RUN set -x && apt-get install -y nodejs make gcc g++ libavahi-compat-libdnssd-dev avahi-daemon avahi-discover libnss-mdns 
RUN set -x && apt-get install -y vim


RUN mkdir /app
WORKDIR /app

RUN npm install feedparser firebase google-home-notifier request
#COPY index.js /app/

CMD service dbus start && service avahi-daemon start && nodejs index.js 
