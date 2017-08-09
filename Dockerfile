FROM alpine:latest
MAINTAINER jckimble <jckimble@thorbis.com>

WORKDIR /var/lib/mysql
VOLUME /var/lib/mysql
COPY startup.sh /startup.sh

RUN apk add --update pwgen mysql mysql-client && rm -f /var/cache/apk/* && chmod +x /startup.sh
COPY my.cnf /etc/mysql/my.cnf
RUN mkdir -p /run/mysqld

EXPOSE 3306
CMD ["/startup.sh"]
