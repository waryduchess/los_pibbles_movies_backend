FROM mysql:8.1

COPY my.cnf /etc/mysql/conf.d/my.cnf
COPY db/init.sql /docker-entrypoint-initdb.d/

ENV MYSQL_ROOT_PASSWORD=los_pibbles_movies
ENV MYSQL_DATABASE=mi_aplicacion
ENV MYSQL_USER=admin
ENV MYSQL_PASSWORD=los_pibbles_movies

EXPOSE 3306
