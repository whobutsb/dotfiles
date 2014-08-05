# UNIX

General notes and gems of information. 

## Unix Philosphy

> Write programs that do one thing and do it well.
> Write programs to work together.
> Write Programs to handle text streams, because that is a universal interface. 

-- Douglas Mcllroy

> "Unix is simple.  It just takes a genius to understand its simplicity."

-- Dennis Ritchie

<!-- MarkdownTOC depth=3 -->

- File System
- Disk
- Searching
    - Find
    - Grep
    - Ack
- Users
- System
    - Security & Setup
- SSH
    - SSH Tunneling

<!-- /MarkdownTOC -->


## File System

Everything is a file in linux. 

- `/` - root of the filesystem
- `/bin` - system binaries (programs)
- `/boot` - boot loader 
- `/dev` - system devices
- `/etc` - system configuration 
- `/home` - user configuration files, users can usually only write files in their home directory
- `/lib` - shared library files used by system binaries
- `/media` - removable media (CDs, USB drives)
- `/mnt` - temp filesystems (USB drives, hard drives, ebs volumes)
- `/opt` - optional software, libreoffice
- `/proc` - provices kernel information.  `/proc/cpuinfo` the number of cores on your system
- `/root` - home directory for root user
- `/srv` - media served by the system.  apache, nginx pages could be served from here
- `/sbin` - sysadmin binaries.  `/sbin/ifconfig` give you ip information
- `/tmp` - temporary storage
- `/usr` - programs, libraries, for all system users
- `/usr/bin` - programs installed for all users by linux, ie: `/usr/bin/find`
- `/usr/local` - sysadmins download and install things here. 
- `/usr/sbin` - system binaries
- `/var` - data that changes frequently.  usually webserver pages.

**File Size** 

command estimates file space usage

    du

Human readable flag

    du -h 

see grand total displayed.

    du -ch

`-s` flag to display only grand total /disk spacee used for specific directories

    du -sh <directory>

_Links_

- [Linux Basics: How To Find Size of Directory Commands](http://www.unixmen.com/linux-basics-find-size-directory-commands/?utm_source=feedburner&utm_medium=feed&utm_campaign=Feed%3A+unixmenhowtos+%28Unixmen+Howtos+%26+Tutorials%29)

***

## Dates and Time

convert unix date into human readable

    date -d @<unix-time>



## Disk 

See what is using Disk IO

    sudo iotop --only

___

## Searching

### Find

- Find stuff in the Filesystem
- Usually located in `/usr/bin/find`
- Searches recursively below specified search path

        find <search_path> [options]

*Command Examples:*

Find a file naem 'cats.txt' below curent directory

    find . -name 'cats.txt'

Find all files below current directory 

    find . -type f

Find all directories below current directory 

    find . -type d

Find all .txt files

    find . -type f -name "*.txt"

Case insensitive file name

    find . -iname "CaTs.txt"

Join find options with `-and` ex: find php files that start with cat

    find . -iname "*.php" -and -iname "cat*"

Files modified less than a day ago

    find . -type f -mtime -1

Directories modified more than 10 days ago

    find . -type d -mtime +10

All files greater than 100MB

    find . -type f -size +100M

All files smaller than 10KB

    find . -type f -size -10K

Remove all zip files bigger than 100MB

    find . -name "*.zip" -size +100M -exec rm -i "{}" \; 

Find and delete files older than 10 days

    find ~/the_directory -mtime +10 -type f -delete

- `-mtime +10` - older than 10 days
- `-type f` - only files

___

### Grep

Grep (g/re/p) stands for global regular-expression print. Its name is derived from a command in "ed" a UNix line-editor built in 1971. 

- use `i` for case insenstive search 
- use `v` to negate
- use `P` to use Perl-Compatible Regular Expressions
- use `c` to count matches 

*Grep Examples*

Find out if Apache is running 

    ps aux | grep -i [apache|httpd]

Find out how many instances of ices are running (wc -l counts lines)

    ps aux | grep -i ices | grep -v grep | wc -l

Find text 'get_user' in all files below current dir with line numbers

    grep -HiERn 'get_user' . 

Same as above, don't include .svn directory

    grep -HiERn 'get_user' . | grep -v '.svn'

How man processors does a system have

    grep -c CPU /proc/cpuinfo

___

### Ack

Ack searches files below the current directory recursively.  It's ideal for use with code since it automatically excludes any .svn, .git directories from its search. 

Ack is not a gnu utility and therefore is not included by default on most unix-like systems. To install 

    apt-get install ack-grep || yum install ack 

*Ack Examples*

Search for a pattern in all files reursively 

    ack <pattern>

Search php files for things

    ack --php <pattern>

## Users

- `useradd <username>` - adds a new user 

**See who is logged in.** 
        
    who || w 

_Links_

- [Cyberciti - FAQ: How can i find out who is logged in?](http://www.cyberciti.biz/faq/how-can-i-find-out-who-is-logged-in/)

## System

### Security & Setup

_Links_

 - [New Server Security Essentials](http://plusbryan.com/my-first-5-minutes-on-a-server-or-essential-security-for-linux-servers)

### Firewalls

#### UFW (Uncomplicated Firewall)

__Links__

- [Ubuntu UFW Guide](https://help.ubuntu.com/community/UFW)
- [Firewalls Guide](http://www.toolsforitservices.com/firewall-tutorials-setup-everyones-favorite-excuse-things-working/)

## SSH

### SSH Tunneling

**Local Port Forwarding**

`ssh -L 3306:localhost:3306 username@hostname`

- `-L` - Setup the local port forwarding
- `3306` - The local port to forward
- `localhost:3306` - Within the remote server, waht address adn port to forward traffic to. Since the MySQL server is on the remote server, we're tunneling to the remote servers "localhost" on port 3306, which MySQL is listening to. 
- `username@localhost` - The SSH username and host to connect to

___

**Remote Port Forwarding**

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

*Links*

- [SSH Kung-Fu](http://blog.tjll.net/ssh-kung-fu/)
- [Servers For Hackers - SSH Tricks](http://serversforhackers.com/editions/2014/07/01/ssh-tricks/)

__General Links__

- [The Bash Guide](http://guide.bash.academy/)
