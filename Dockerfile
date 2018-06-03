FROM raspbian/jessie

MAINTAINER koduki

ADD https://deb.nodesource.com/setup_10.x setup_10.x 
RUN bash -x setup_10.x
RUN apt-get install -y nodejs gcc g++ make

CMD ["nodejs", "--version"]