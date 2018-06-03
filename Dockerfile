FROM raspbian/jessie

MAINTAINER koduki

RUN wget https://deb.nodesource.com/setup_10.x -O - | bash
RUN apt-get install -y nodejs

CMD ["nodejs", "--version"]