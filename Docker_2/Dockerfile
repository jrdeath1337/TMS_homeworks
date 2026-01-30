FROM alpine:3.19
LABEL owner=jrdeath1337@gmail.com
LABEL version=1.0 

RUN adduser -D -s /bin/sh -h /home/jrdeath jrdeath jrdeath
RUN chown -R jrdeath:jrdeath /home/jrdeath/
WORKDIR /home/jrdeath/

RUN apk update && apk upgrade &&\
  apk add --no-cache git nano nginx 
COPY hello.txt /hello/

VOLUME /logs/

COPY ./hello.sh /home/jrdeath/
CMD ["./hello.sh"]

