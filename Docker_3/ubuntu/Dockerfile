FROM ubuntu:20.04
RUN apt update -y &&\
  apt install curl nginx -y &&\
  mkdir -p /app/static
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./static/ /app/static
EXPOSE 8080
CMD ["nginx","-c","/etc/nginx/nginx.conf","-g","daemon off;"]
