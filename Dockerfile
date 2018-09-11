FROM nginx:alpine

MAINTAINER Adrien Houdart version: 0.1

RUN apk add --no-cache bash
RUN apk add --no-cache nano
RUN apk --no-cache add gettext

COPY nginx.conf /etc/nginx/nginx.conf
COPY default.conf.template /etc/nginx/conf.d/

ENV CONTEXT_PATH "/"

VOLUME /usr/share/nginx/html

CMD /bin/sh -c "envsubst '\$CONTEXT_PATH' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;' || /etc/nginx/conf.d/default.conf"