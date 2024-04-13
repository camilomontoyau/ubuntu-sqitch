FROM ubuntu:24.04

# Install sqitch
RUN apt-get update && apt-get install -y sqitch;

# Install mysql client
RUN apt-get install -y mysql-client;

# Install postgresql client
RUN apt-get install -y postgresql-client;

# Install DBD::mysql Perl module
RUN apt-get install -y libdbd-mysql-perl;

WORKDIR /usr/src/sqitch-project;

ENV DB_ENGINE=mysql
ENV MYSQL_USER=root
ENV MYSQL_PASSWORD=root
ENV MYSQL_HOST=mysql
ENV MYSQL_PORT=3306
ENV MYSQL_DATABASE=database

COPY ./scripts/run.sh /usr/src/run.sh
COPY ./scripts/mysql.sh /usr/src/mysql.sh
COPY ./scripts/postgres.sh /usr/src/postgres.sh


CMD ["/usr/src/run.sh"]