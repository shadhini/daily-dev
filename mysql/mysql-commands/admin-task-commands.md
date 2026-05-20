# MySQL admin tasks related commands

## MySQL user & user privileges management

    mysql -u <USERNAME> -p <PASSWORD>
---

    SELECT user, host, authentication_string FROM mysql.user;
    SELECT user, host, plugin, HEX(authentication_string) AS auth_hex FROM mysql.user;
---

    CREATE USER 'test'@'localhost' IDENTIFIED WITH 'mysql_native_password'; 
    CREATE USER 'test'@'localhost' IDENTIFIED WITH 'mysql_native_password' BY 'testpassword';
    <!-- plugin: `mysql_native_password` -->

    CREATE USER '<USER_NAME>'@'%' IDENTIFIED BY '<PASSWORD>'; 
    <!-- plugin: `caching_sha2_password` -->

    ALTER USER 'myuser'@'host' IDENTIFIED WITH caching_sha2_password BY 'your_password'; 
    ALTER USER 'test'@'localhost' IDENTIFIED WITH 'mysql_native_password' BY 'testpassword';

    FLUSH PRIVILEGES;
---

    show databases;
    create database testdb;
    GRANT ALL PRIVILEGES ON testdb.* TO 'test'@'localhost';
---

    GRANT ALL PRIVILEGES ON *.* TO 'test'@'localhost' WITH GRANT OPTION;
---

    SHOW GRANTS FOR  'test'@'localhost';

