FROM ubuntu:16.04

RUN adduser --disabled-password --gecos "Nathan" nathan

RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y tcsh

RUN mkdir -p /home/nathan
RUN mkdir -p /usr/local/lib
RUN mkdir -p /usr/local/include

WORKDIR /home/nathan

COPY . /home/nathan

COPY ./install/lib/libnathanC.a /usr/local/lib
COPY ./install/include/nathan.h /usr/local/include

RUN chown -R nathan:nathan /home/nathan

ENV HOME /home/nathan

EXPOSE 8002
CMD ["tcsh"]
