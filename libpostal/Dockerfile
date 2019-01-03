FROM alpine

MAINTAINER Kurt Ruppel <me@kurtruppel.com>

RUN apk add --update autoconf automake build-base curl git libtool
RUN git clone https://github.com/openvenues/libpostal.git

WORKDIR /libpostal

RUN ./bootstrap.sh
RUN ./configure
RUN make && make install
