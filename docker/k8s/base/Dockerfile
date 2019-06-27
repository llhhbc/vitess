
FROM debian:stretch-slim


COPY ./sources.list  /etc/apt/sources.list

RUN apt-get update && apt-get -y install apt-utils  net-tools lsof sudo

RUN echo "vitess ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

