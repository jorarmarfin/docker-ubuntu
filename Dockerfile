FROM ubuntu:16.04

# Environments vars
ENV TERM=xterm

RUN apt-get update && apt-get -y upgrade; 

CMD ["/init.sh"]