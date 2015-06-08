#!/bin/bash

TEST=`gosu postgres postgres --single <<- EOSQL
   SELECT 1 FROM pg_database WHERE datname='$DB_NAME';
EOSQL`

echo "******CREATING DOCKER DATABASE******"
if [[ $TEST == "1" ]]; then
    # database exists
    # $? is 0
    exit 0
else
gosu postgres postgres --single <<- EOSQL
   CREATE ROLE $DB_USER WITH LOGIN ENCRYPTED PASSWORD '${DB_PASS}' CREATEDB;
EOSQL

gosu postgres postgres --single <<- EOSQL
   CREATE DATABASE $DB_NAME WITH OWNER $DB_USER TEMPLATE template0 ENCODING 'UTF8';
EOSQL

gosu postgres postgres --single <<- EOSQL
   GRANT ALL PRIVILEGES ON DATABASE $DB_NAME TO $DB_USER;
EOSQL

gosu postgres pg_ctl start -w && gosu postgres psql -U "$DB_USER" -d "$DB_NAME" -f "$DB_PG_DUMP_FILE" && gosu postgres pg_ctl stop -w && /bin/rm -f ${DB_PG_DUMP_FILE}

fi

echo ""
echo "******DOCKER DATABASE CREATED******"