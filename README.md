# docker-lnpp

linux nginx postgres php

## Requirements
docker and compose

## Usage
```

1. Place php code in src directory. 
2. Add sql dump in postgres/db.sql
3. Adjust database name username password in docker-compose.yml
4. In you code connect to the database

```
$dsn = 'pgsql:dbname=' . getenv('DB_NAME') . ';host=db';
$username = getenv('DB_USER');
$password = getenv('DB_PASS');
$db = new PDO($dsn, $username, $password);
```

3. Run

```
docker-compose up


=====================

[Docker]:                      https://www.docker.io/
[Compose]:                     http://docs.docker.com/compose/install/
