#FROM raspbian/jessie
FROM arm32v7/debian

MAINTAINER koduki

RUN set -x && wget https://deb.nodesource.com/setup_10.x -O - | bash
RUN set -x && apt-get update && apt-get install -y nodejs make gcc g++ libavahi-compat-libdnssd-dev avahi-daemon avahi-discover libnss-mdns vim

RUN set -x && mkdir /app
WORKDIR /app

RUN set -x && npm install feedparser firebase google-home-notifier request
COPY index.js /app/

CMD service dbus start && service avahi-daemon start && nodejs index.js 