FROM debian:latest

MAINTAINER Steve Müller "st.mueller@dzh-online.de"

ENV VERSION 5.5.9

ADD ./build.sh /tmp/
ADD ./php.ini /tmp/

RUN /tmp/build.sh ${VERSION}

