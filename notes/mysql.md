# MySQL

Watch the process list

    watch 'mysql -e "show proesslist;"'

Add User to db

    GRANT USAGE ON *.* TO '<user>'@'%' IDENTIFIED BY '<password>'; 

Grant user Access

    GRANT SELECT, INSERT, UPDATE, DELETE, EXECUTE ON <database>.* TO '<user>'@'%';

Delete User

    DROP USER '<user>'@'%'; 
    FLUSH PRIVILEGES; 

Find User Privileges

    SHOW GRANTS for '<username>'; 
    -- or
    SHOW GRANTS FOR CURRENT_USER;

Revoke User Privileges 

    REVOKE INSERT ON *.* FROM '<username>'@'%'; 

Rename User
    
    RENAME USER 'jeffrey'@'localhost' TO 'jeff'@'127.0.0.1';

Set Password

    SET PASSWORD FOR 'bob'@'%.example.org' = PASSWORD('cleartext password');


Update Password

    UPDATE mysql.user SET Password=PASSWORD('cleartext password')  WHERE User='bob' AND Host='%.example.org';
    FLUSH PRIVILEGES;

MySQLDump a Single Database

    mysqldump --compress -h localhost -u [username] -p --quick --single-transaction [db_name] > [dumpfile]

MySQLDump Databases

    -- Note to use --add-drop-database You must use --databases
    mysqldump -h localhost -u [username] -p --add-drop-database --skip-comments --routines --compress --quick --single-transaction --databases [db_name] > [dumpfile]

Show Indexes

    SHOW INDEX FROM `table`; 

___

## MySQL Replication

things to know:

- REPLICATION SETUP: http://plusbryan.com/mysql-replication-without-downtime
- Trust Replication
- Monitor Seconds_Behind_Master
- Monitor Exec_Master_Log_Pos
- Run SHOW PROCESSLIST;—take note of the SQL thread to see if it is processing - long running queries.
- Keep an eye on master_db_host:/var/log/mysql/slow.log—this is a log of the - longest-running mysql queries—try to optimize 'em
- SHOW PROCESSLIST; (or SHOW FULL PROCESSLIST;) on the Slave:
    - there should be two DB Connections whose user name is system user
    - One of those DB Connections will have the current SQL statement being - processed by replication.
    - As long as a different SQL statement is visible each time you run SHOW - PROCESSLIST;, you can trust mysql is still replicating properly.

MySQL Replication Last_Error: Duplicate Key Entry

    stop slave; set global mysql_slave_skip_counter = 1; start slave; -- repeat :)