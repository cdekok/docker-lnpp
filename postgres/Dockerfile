FROM postgres

MAINTAINER Chris de Kok <chris.de.kok@gmail.com>

ENV DB_NAME database
ENV DB_USER admin
ENV DB_PASS password
ENV DB_PG_DUMP_FILE /tmp/db.sql

ADD setup-database.sh /docker-entrypoint-initdb.d/
ADD db.sql /tmp/db.sql
RUN chmod 755 /docker-entrypoint-initdb.d/setup-database.sh