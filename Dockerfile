FROM ubuntu:20.04

# Install sqitch
RUN apt-get update && apt-get install -y sqitch;

# Install mysql client
RUN apt-get install -y mysql-client;

# Install postgresql client
RUN apt-get install -y postgresql-client;

# Install DBD::mysql Perl module
RUN apt-get install -y libdbd-mysql-perl;

# Install Python 3
RUN apt-get install -y python3;

# Install MySQL Connector for Python
RUN apt-get install -y python3-pip;

# RUN apt-get install python3-dev default-libmysqlclient-dev build-essential
RUN pip3 install mysql-connector-python

RUN pip3 install python-dotenv

ENV DB_ENGINE=mysql
ENV MYSQL_USER=root
ENV MYSQL_PASSWORD=root
ENV MYSQL_HOST=mysql
ENV MYSQL_PORT=3306
ENV MYSQL_DATABASE=database
ENV MYSQL_DATABASE_PING=test

#hacer copy de la carpeta de ping
COPY ./ping-sqitch /usr/src/ping-sqitch
#hacer copy de ping.sh
COPY ./ping-sqitch/ping.sh /usr/src/ping-sqitch/ping.sh
#hacer workdir para carpeta de ping en /usr/src


WORKDIR /usr/src/sqitch-project;

COPY ./scripts/run.sh /usr/src/run.sh
COPY ./scripts/mysql.sh /usr/src/mysql.sh
COPY ./scripts/postgres.sh /usr/src/postgres.sh

CMD ["/usr/src/run.sh"]