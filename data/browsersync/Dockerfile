FROM node:latest

MAINTAINER Tom Hanoldt<tom@creative-workflow.berlin>

RUN apt-get update \
  && npm install -g gulp

CMD cd /var/www/html && npm install --cached && gulp serve
