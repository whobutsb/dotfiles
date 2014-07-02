# Bash / Linux Notes

## Users

**See who is logged in.** 
        
    who || w 

http://www.cyberciti.biz/faq/how-can-i-find-out-who-is-logged-in/

## System

### Security & Setup

[New Server Security Essentials](http://plusbryan.com/my-first-5-minutes-on-a-server-or-essential-security-for-linux-servers)

### Disk 

**See what is using Disk IO**

    sudo iotop --only

## MySQL

**Watch the process list**

    watch 'mysql -e "show proesslist;"'
