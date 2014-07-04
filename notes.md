# Bash / Linux Notes

## Users

**See who is logged in.** 
        
    who || w 

http://www.cyberciti.biz/faq/how-can-i-find-out-who-is-logged-in/

## System

### Security & Setup

[New Server Security Essentials](http://plusbryan.com/my-first-5-minutes-on-a-server-or-essential-security-for-linux-servers)

## SSH

### SSH Tunneling

** Local Port Forwarding **

`ssh -L 3306:localhost:3306 username@hostname`

- `-L` - Setup the local port forwarding
- `3306` - The local port to forward
- `localhost:3306` - Within the remote server, waht address adn port to forward traffic to. Since the MySQL server is on the remote server, we're tunneling to the remote servers "localhost" on port 3306, which MySQL is listening to. 
- `username@localhost` - The SSH username and host to connect to

** Remote Port Forwarding **

Remote Port Forwarding is good if you need to share your local computer with others who are outside of your network. 

To do this, we need a remote server all parties can reach.  AWS or Digital Ocean will do. 

First, let's pretend our local computer has a web server running on port `8001`: 

    # On our local machine:
    $ curl localhost:8001
    Hi!

We want our friends to see our website, which simply says "Hi!".  Let's use a remote server to forward the requests to our local computer: 

    # Still on our local machine:
    ssh -R 9000:localhost:8001 username@hostname

 - `-R` - using remote port forwarding
 - `9000` - The remote server's port ot use (not our local server this time).
 - `localhost:8001` - The local address to foward to. Since our webserver is on localhost port `8001`, that's what we specify here. 
- `username@hostname` - SSH access to the remote server

If our remote server's IP address was `123.123.123.123`, then our friends can access our website at `123.123.123.123:9000`, which will forward to our lcoal site at `localhost:8001`. 

**Links**
- http://blog.tjll.net/ssh-kung-fu/
- http://serversforhackers.com/editions/2014/07/01/ssh-tricks/

### Disk 

**See what is using Disk IO**

    sudo iotop --only

## MySQL

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

MySQL Replication things to know:

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

