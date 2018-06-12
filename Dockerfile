FROM raspbian/jessie

MAINTAINER koduki

RUN wget https://deb.nodesource.com/setup_10.x -O - | bash
RUN apt-get install -y nodejs make gcc g++ libavahi-compat-libdnssd-dev avahi-daemon avahi-discover libnss-mdns vim

RUN mkdir /app
WORKDIR /app

RUN npm install feedparser firebase google-home-notifier request
COPY index.js /app/

CMD service dbus start && service avahi-daemon start && nodejs index.js