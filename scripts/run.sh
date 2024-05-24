#!/bin/bash

# get DB_ENGINE environment variable
DB_ENGINE=${DB_ENGINE:-default}

echo "DB_ENGINE: $DB_ENGINE"

# Check if DB_ENGINE is mysql
if [ "$DB_ENGINE" = "mysql" ]; then

  # correr ping-mysql.sh
  # Run mysql.sh script
  /usr/src/mysql.sh
fi

# Check if DB_ENGINE is postgres
if [ "$DB_ENGINE" = "postgres" ]; then

  # Run postgres.sh script
  /usr/src/postgres.sh
fi

echo "====  Done running database setup ===";