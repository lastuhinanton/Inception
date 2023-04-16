ARG VERSION=3.17.3
FROM alpine:$VERSION

RUN apk update && apk upgrade && \
    apk add --no-cache mariadb mariadb-common mariadb-client openrc

RUN mkdir /var/run/mysqld; \
    chmod 777 /var/run/mysqld; \
    { echo '[mysqld]'; \
      echo 'skip-host-cache'; \
      echo 'skip-name-resolve'; \
      echo 'bind-address=0.0.0.0'; \
    } | tee  /etc/my.cnf.d/docker.cnf; \
    sed -i "s|skip-networking|skip-networking=0|g" \
      /etc/my.cnf.d/mariadb-server.cnf

RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql

EXPOSE 3306

COPY ./tools/rundb.sh .
RUN sh rundb.sh && rm rundb.sh
USER mysql

ENTRYPOINT ["/usr/bin/mysqld", "--skip-log-error"]
