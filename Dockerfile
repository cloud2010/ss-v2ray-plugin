FROM shadowsocks/shadowsocks-libev

ENV SERVER_ADDR 0.0.0.0
ENV PORT        8080
ENV PASSWORD    ss123456
ENV METHOD      chacha20
ENV TIMEOUT     300
ENV DNS_ADDRS   8.8.8.8,8.8.4.4
ENV DOMAIN=
ENV ARGS=

USER root

RUN mkdir -p /root/.acme.sh
  
VOLUME /root/.acme.sh

CMD exec ss-server \
      -s $SERVER_ADDR \
      -p $PORT \
      -k ${PASSWORD:-$(hostname)} \
      -m $METHOD \
      -t $TIMEOUT \
      -d $DNS_ADDRS \
      -u \
      $ARGS
