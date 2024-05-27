# se debe correr donde este el proyecto ping

#debe tomar las variables de entorno que se pasen en el docker run
# Get MYSQL_USER environment variable
MYSQL_USER=${MYSQL_USER:-default}

# Get MYSQL_PASSWORD environment variable
MYSQL_PASSWORD=${MYSQL_PASSWORD:-default}

# Get MYSQL_DATABASE environment variable
MYSQL_DATABASE_PING=${MYSQL_DATABASE_PING:-default}

# Get MYSQL_HOST environment variable
MYSQL_HOST=${MYSQL_HOST:-default}

# Get MYSQL_PORT environment variable
MYSQL_PORT=${MYSQL_PORT:-default}

#Debe correr el proyecto ping antes de genesis_verify.py

#hacer deploy apra crear la bd de sqitch
# Deploy changes to database
sqitch deploy db:mysql://$MYSQL_USER:$MYSQL_PASSWORD@$MYSQL_HOST:$MYSQL_PORT/$MYSQL_DATABASE_PING --mode change;

echo "Se ejecuto el archivo de ping.sh";