FROM debian:jessie

MAINTAINER Kevin Coffey <kevdougful@gmail.com>

RUN apt-get update && \
    apt-get install -y \
        minidlna \
    && rm -rf /var/lib/apt/lists/* && \
    apt-get clean
    
RUN adduser --system \
            --gecos "MiniDLNA Service" \
            --disabled-password \
            --group \
            --home /var/lib/minidlna \
            minidlna

COPY ./start.sh /start.sh
COPY ./minidlna.conf /etc/minidlna.conf
            
VOLUME /video
       /music
       /photo

USER minidlna
       
ENTRYPOINT ["/start.sh"]
