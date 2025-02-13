### Manage connections 

---

All the processes running in the MySQL server

    SHOW PROCESSLIST;

- 

        +-----+-----------------+-----------------+-------------------------------+---------+-------+------------------------+------------------+
        | Id  | User            | Host            | db                            | Command | Time  | State                  | Info             |
        +-----+-----------------+-----------------+-------------------------------+---------+-------+------------------------+------------------+
        |   5 | event_scheduler | localhost       | NULL                          | Daemon  | 97602 | Waiting on empty queue | NULL             |
        |  33 | docker-webapp   | localhost:58633 | NULL                          | Sleep   |  4232 |                        | NULL             |
        |  34 | docker-webapp   | localhost:58634 | NULL                          | Sleep   |  4232 |                        | NULL             |
        |  35 | bi              | localhost:58637 | NULL                          | Sleep   |  4218 |                        | NULL             |
        |  36 | bi              | localhost:58638 | NULL                          | Sleep   |  4218 |                        | NULL             |
        |  39 | ob-root         | localhost:58644 | NULL                          | Sleep   |  1776 |                        | NULL             |
        |  40 | ob-root         | localhost:58645 | NULL                          | Sleep   |  1931 |                        | NULL             |
        | 135 | ob-root         | localhost:59324 | berlin_openbank_userdb        | Sleep   |   919 |                        | NULL             |
        | 136 | ob-root         | localhost:59325 | berlin_openbank_userdb        | Sleep   |   919 |                        | NULL             |
        | 137 | ob-root         | localhost:59326 | berlin_openbank_govdb         | Sleep   |   913 |                        | NULL             |
        | 138 | ob-root         | localhost:59327 | berlin_openbank_iskm_configdb | Sleep   |   923 |                        | NULL             |
        | 139 | ob-root         | localhost:59328 | berlin_openbank_iskm_configdb | Sleep   |   957 |                        | NULL             |
        | 140 | ob-root         | localhost:59332 | berlin_openbank_govdb         | Sleep   |   921 |                        | NULL             |
        | 141 | ob-root         | localhost:59337 | berlin_openbank_apimgtdb      | Sleep   |   919 |                        | NULL             |
        | 142 | ob-root         | localhost:59338 | berlin_openbank_apimgtdb      | Sleep   |   919 |                        | NULL             |
        | 143 | ob-root         | localhost:59339 | berlin_openbank_iskm_configdb | Sleep   |   964 |                        | NULL             |
        | 144 | ob-root         | localhost:59341 | berlin_openbank_openbankingdb | Sleep   |   960 |                        | NULL             |
        | 281 | root            | localhost       | NULL                          | Query   |     0 | init                   | SHOW PROCESSLIST |
        +-----+-----------------+-----------------+-------------------------------+---------+-------+------------------------+------------------+
        18 rows in set, 1 warning (0.00 sec)
---

Maximum number of connections allowed by the MySQL server

     SHOW VARIABLES LIKE 'max_connections'; 

-
        +-----------------+-------+
        | Variable_name   | Value |
        +-----------------+-------+
        | max_connections | 151   |
        +-----------------+-------+
        1 row in set (0.01 sec)


---

Maximum number of connections allowed for a specific user

     SELECT user, host, max_connections, max_user_connections FROM mysql.user WHERE user = 'ob-root';

-
        +---------+-----------+-----------------+----------------------+
        | user    | host      | max_connections | max_user_connections |
        +---------+-----------+-----------------+----------------------+
        | ob-root | localhost |               0 |                    0 |
        +---------+-----------+-----------------+----------------------+
        1 row in set (0.00 sec) 

---

Maximum number of connections allowed for a user by the MySQL server


     SHOW VARIABLES LIKE 'max_user_connections';

-
        +----------------------+-------+
        | Variable_name        | Value |
        +----------------------+-------+
        | max_user_connections | 0     |
        +----------------------+-------+
        1 row in set (0.00 sec)

---

Change the maximum number of connections allowed for a user

     ALTER USER 'ob-root'@'localhost' WITH MAX_CONNECTIONS_PER_HOUR 100 MAX_USER_CONNECTIONS 100; 

---

Temporarily change the maximum number of connections 

     SET GLOBAL max_connections = 200;



