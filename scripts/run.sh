#!/bin/bash

# get DB_ENGINE environment variable
DB_ENGINE=${DB_ENGINE:-default}

echo "DB_ENGINE: $DB_ENGINE"

# Check if DB_ENGINE is mysql
if [ "$DB_ENGINE" = "mysql" ]; then
  # Run mysql.sh script
  ./mysql.sh
fi

# Check if DB_ENGINE is postgres
if [ "$DB_ENGINE" = "postgres" ]; then
  # Run postgres.sh script
  ./postgres.sh
fi

echo "====  Done running database setup ===";