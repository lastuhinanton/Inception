ARG ALPINE_VERSION
    
FROM alpine:${ALPINE_VERSION}

ARG DB_NAME \
    DB_USER \
    DB_PASS 

RUN apk update && apk upgrade && \
    apk add --no-cache mariadb mariadb-client

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

COPY ./requirements/mariadb/tools/rundb.sh .
RUN sh rundb.sh && rm rundb.sh
USER mysql
CMD ["/usr/bin/mysqld", "--skip-log-error"]
