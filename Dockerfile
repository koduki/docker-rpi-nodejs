FROM raspbian/jessie

MAINTAINER koduki

RUN wget https://deb.nodesource.com/setup_10.x -O - | bash || echo "dummy"
RUN apt-get install -y nodejs gcc g++ make

CMD ["nodejs", "--version"]