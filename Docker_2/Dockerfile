FROM alpine:3.19
LABEL owner=jrdeath1337@gmail.com
LABEL version=1.0 

COPY ./hello.sh /home/jrdeath/
COPY hello.txt /home/jrdeath/

RUN adduser -D -s /bin/sh -h /home/jrdeath jrdeath jrdeath &&\
mkdir -p /home/jrdeath/logs &&\
chown -R jrdeath:jrdeath /home/jrdeath &&\ 
chmod +x /home/jrdeath/hello.sh &&\
apk update && apk upgrade &&\
  apk add --no-cache git nano nginx && rm -r /var/cache/apk/* 

WORKDIR /home/jrdeath/
VOLUME /home/jrdeath/logs

USER jrdeath
CMD ["./hello.sh"]
