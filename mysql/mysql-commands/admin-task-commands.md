# MySQL admin tasks related commands

## MySQL user & user privileges management

    mysql -u <USERNAME> -p <PASSWORD>
---

    SELECT user, host, authentication_string FROM mysql.user;
---

    CREATE USER 'test'@'localhost' IDENTIFIED WITH 'mysql_native_password';
---

    ALTER USER 'test'@'localhost' IDENTIFIED WITH 'mysql_native_password' BY 'testpassword';
---

    CREATE USER 'test'@'localhost' IDENTIFIED WITH 'mysql_native_password' BY 'testpassword';
---

    show databases;
    create database testdb;
    GRANT ALL PRIVILEGES ON testdb.* TO 'test'@'localhost';
---

    GRANT ALL PRIVILEGES ON *.* TO 'test'@'localhost' WITH GRANT OPTION;
---

    SHOW GRANTS FOR  'test'@'localhost';

