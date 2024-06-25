#!/bin/bash

# Get MYSQL_USER environment variable
MYSQL_USER=${MYSQL_USER:-default}

# Get MYSQL_PASSWORD environment variable
MYSQL_PASSWORD=${MYSQL_PASSWORD:-default}

# Get MYSQL_DATABASE environment variable
MYSQL_DATABASE=${MYSQL_DATABASE:-default}

# Get MYSQL_HOST environment variable
MYSQL_HOST=${MYSQL_HOST:-default}

# Get MYSQL_PORT environment variable
MYSQL_PORT=${MYSQL_PORT:-default}

# check if DB is already created at MYSQL_HOST
mysql -u $MYSQL_USER -p$MYSQL_PASSWORD -h $MYSQL_HOST -P $MYSQL_PORT -e "use $MYSQL_DATABASE" 2>/dev/null;

# if DB is not created, create it
if [ $? -ne 0 ]; then
  echo "Creating database $MYSQL_DATABASE";
  mysql -u $MYSQL_USER -p$MYSQL_PASSWORD -h $MYSQL_HOST -P $MYSQL_PORT -e "create database $MYSQL_DATABASE";
  mysql -u $MYSQL_USER -p$MYSQL_PASSWORD -h $MYSQL_HOST -P $MYSQL_PORT -e "create tablespace ts_$MYSQL_DATABASE";
fi

cd /usr/src/sqitch-project;

pwd;
ls -la;

sed -i'' "s/XXXXXXXXXXXXXXXXXXXX/$MYSQL_DATABASE/g" "/usr/src/sqitch-project/sqitch.plan";

echo "estoy en el proyecto de sqitch";
# Run genesis_verify
python3 /usr/src/sqitch-project/genesis_verify.py;

head /usr/src/sqitch-project/sqitch.plan;

cd /usr/src/sqitch-project;

pwd;

echo "YA VA EJECUTAR EL DEPLOY";
# Deploy changes to database
echo "MYSQL_USER: $MYSQL_USER";
echo "MYSQL_PASSWORD: $MYSQL_PASSWORD";
echo "MYSQL_DATABASE: $MYSQL_DATABASE";
echo "MYSQL_HOST: $MYSQL_HOST";
echo "MYSQL_PORT: $MYSQL_PORT";

sqitch deploy --verify db:mysql://$MYSQL_USER:$MYSQL_PASSWORD@$MYSQL_HOST:$MYSQL_PORT/$MYSQL_DATABASE --mode change  -f /usr/src/sqitch-project/sqitch.plan;

sed -i'' "s/$MYSQL_DATABASE/XXXXXXXXXXXXXXXXXXXX/g" "/usr/src/sqitch-project/sqitch.plan";






