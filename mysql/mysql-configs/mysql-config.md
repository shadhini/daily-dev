## MySQL Configurations

---
MySQL Configuration file: `my.cnf` or `my.ini`
* Default options are read from the following mysql configuration files in the given order:
    1. /etc/my.cnf
    2. /etc/mysql/my.cnf
    3. /usr/local/mysql/etc/my.cnf
    4. ~/.my.cnf

Figuring out mysql configuration file location on macOS

    mysql --help | grep my.cnf

-
        order of preference, my.cnf, $MYSQL_TCP_PORT,
        /etc/my.cnf /etc/mysql/my.cnf /usr/local/mysql/etc/my.cnf ~/.my.cnf


    where mysql

-
        /usr/local/mysql/bin/mysql

If still there's no existing `my.cnf` file, create one for current user in ~/.my.cnf or in the MySQL installation directory.
  
      ~/.my.cnf


---

### Maximum number of connections allowed by the MySQL server
Permanently change the maximum number of connections (Persists After MySQL Restarts)

1. Edit the MySQL configuration file

        [mysqld]
        max_connections = 200

2. Restart the MySQL server:

       sudo service mysql restart
