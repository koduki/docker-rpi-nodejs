#FROM raspbian/jessie
FROM arm32v7/debian

MAINTAINER koduki

ADD https://deb.nodesource.com/setup_10.x setup.sh
RUN set -x && apt-get update -y && apt-get install -y gnupg && bash ./setup.sh
RUN set -x && apt-get install -y nodejs make gcc g++ libavahi-compat-libdnssd-dev avahi-daemon avahi-discover libnss-mdns vim

RUN mkdir /app
WORKDIR /app

RUN npm install feedparser firebase google-home-notifier request
#COPY index.js /app/

CMD service dbus start && service avahi-daemon start && nodejs index.js 