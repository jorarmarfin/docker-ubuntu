FROM ubuntu:16.04

# Environments vars
ENV TERM=xterm
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get -y upgrade; \
apt-get install -y vim python3 wget;

# Init
ADD init.sh /init.sh
RUN chmod 755 /*.sh

CMD [ "/init.sh" ]