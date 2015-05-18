FROM sunyi00/ubuntu-python:latest


RUN apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 573BFD6B3D8FBC641079A6ABABF5BD827BD9BF62
RUN echo "deb http://nginx.org/packages/mainline/ubuntu/ trusty nginx" >> /etc/apt/sources.list

ENV NGINX_VERSION 1.9.0-1~trusty

RUN apt-get update && \
    apt-get install -y ca-certificates nginx=${NGINX_VERSION} supervisor && \
    rm -rf /var/lib/apt/lists/*

VOLUME ["/var/cache/nginx"]

EXPOSE 80 443
