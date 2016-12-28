# UNIX

General notes and gems of information.

## Unix Philosphy

> Write programs that do one thing and do it well.
> Write programs to work together.
> Write Programs to handle text streams, because that is a universal interface.
> -- Douglas Mcllroy

> "Unix is simple.  It just takes a genius to understand its simplicity."
> -- Dennis Ritchie

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

## Dates and Time

convert unix date into human readable

    date -d @<unix-time>

## Disk

See what is using Disk IO

    sudo iotop --only

## Searching

### Find

- Find stuff in the Filesystem
- Usually located in `/usr/bin/find`
- Searches recursively below specified search path


  `find <search_path> [options] [query]`

**Command Examples:**

Find a file name `cats.txt` below curent directory

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

### Articles

[Find Files in Linux, Using the Commmand Line](https://www.linode.com/docs/tools-reference/tools/find-files-in-linux-using-the-command-line)

## Grep

Grep (g/re/p) stands for global regular-expression print. Its name is derived from a command in "ed" a UNix line-editor built in 1971.

- use `i` for case insenstive search
- use `v` to negate
- use `P` to use Perl-Compatible Regular Expressions
- use `c` to count matches

**Grep Examples**

Find out if Apache is running

    ps aux | grep -i [apache|httpd]

Find out how many instances of ices are running (wc -l counts lines)

    ps aux | grep -i ices | grep -v grep | wc -l

Find text `get_user` in all files below current dir with line numbers

    grep -HiERn 'get_user' .

Same as above, don't include .svn directory

    grep -HiERn 'get_user' . | grep -v '.svn'

How man processors does a system have

    grep -c CPU /proc/cpuinfo

## Ack

Ack searches files below the current directory recursively.  It's ideal for use with code since it automatically excludes any .svn, .git directories from its search.

Ack is not a gnu utility and therefore is not included by default on most unix-like systems. To install

    apt-get install ack-grep || yum install ack

**Ack Examples**

Search for a pattern in all files reursively

    ack <pattern>

Search php files for things

    ack --php <pattern>

## Users

- `useradd <username>` - adds a new user

**See who is logged in.**

    who || w

### Links

- [Cyberciti - FAQ: How can i find out who is logged in?](http://www.cyberciti.biz/faq/how-can-i-find-out-who-is-logged-in/)

## Networking

### lsof

Check to see what process is using a port 

`lsof -i:8090`

Check to see if the host and port can be connected to.

    nc -vz <hostname> -w 1 <port>

### /etc/hosts

As your machine gets started, it will need to know the mapping of some hostnames to 
IP addresses before DNS can be referenced.

Used to reference local resources with nice domain names.

`192.168.1.1    example.dev`

The `/etc/hosts` file can be used to block certain websites.

`0.0.0.0 2 girls1cup.nl` <-- do not open

See this list for suggestions of hosts to block[http://someonewhocares.org/hosts/](http://someonewhocares.org/hosts/)

### Setup Static IP Address

Edit `/etc/network/interfaces` to reflect something like this:

```
# This file describes the network interfaces available on your system
# and how to activate them. For more information, see interfaces(5).

# The loopback network interface
auto lo
iface lo inet loopback

# The primary network interface
auto eth0
iface eth0 inet static
address 192.168.0.X                 # ip address to use
netmask 255.255.255.0
network 192.168.0.0
broadcast 192.168.0.255
gateway 192.168.0.X                 # local gateway
dns-nameservers 192.168.0.X         # dns-nameserver
```

Run: `sudo /etc/init.d/networking restart`


## System

### Security & Setup

_Links_

 - [New Server Security Essentials](http://plusbryan.com/my-first-5-minutes-on-a-server-or-essential-security-for-linux-servers)

## Firewalls

### UFW (Uncomplicated Firewall)

### Links

- [Ubuntu UFW Guide](https://help.ubuntu.com/community/UFW)
- [Firewalls Guide](http://www.toolsforitservices.com/firewall-tutorials-setup-everyones-favorite-excuse-things-working/)

## SSH

### Add Public Key to remote server

        `cat <ssh-key.pub> | ssh <user>@<ip-address> "cat >> ~/.ssh/authorized_keys"`

### Local Port Forwarding

`ssh -L 3306:localhost:3306 username@hostname`

` ssh -L <local-ip>:<local-port>:<remote-ip>:<remote-port>`

- `-L` - Setup the local port forwarding
- `3306` - The local port to forward
- `localhost:3306` - Within the remote server, what address and port to forward traffic to. Since the MySQL server is on the remote server, we're tunneling to the remote servers "localhost" on port 3306, which MySQL is listening to.
- `username@localhost` - The SSH username and host to connect to

### Proxying in with another SSH host

```
Host name
  Hostname [ip_address | hostname]
  User username
  Port port
  ProxyCommand ssh -a -W %h:%p other_host
```

### Remote Port Forwarding

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

### Links

- [SSH Kung-Fu](http://blog.tjll.net/ssh-kung-fu/)
- [Servers For Hackers - SSH Tricks](http://serversforhackers.com/editions/2014/07/01/ssh-tricks/)



## Standard IO and Pipes

https://miteshshah.github.io/linux/basics/standard-io-and-pipes/

* `command < file`                Send file as a Input to the command.
* `command > file`        Redirect STDOUT of command to file.
* `command >> file`       Append STDOUT of command to file.
* `command 2> file`       Redirect STDERR of command to file.
* `command 2>> file`              Append STDERR of command to file.


## Run Commands in the Background

`nohup` allows you to run command/process or shell script that can continue running
in the background after you log out from a shell.

```
nohup command-name &
```

To change the output file name use

```
nohup command-name > out.txt &
```

Use `jobs -l` to list all jobs.

## RSync

**Resuming a Partial Sync**

This works well for resuming a broken pipe during SCP.

```
rsync --partial --progress --rsh=ssh local_file user@host:remote_file
```

## Removing Old Kernels

Get the current kernel version

    uname -r

Get the list of the installed kernels

    dpkg --list | grep linux-image

Remove the kernels

    sudo apt-get purge linux-image-x.x.x.x-generic

### Links

- [How to Remove Old Kernels from Ubuntu 13.04, 13.10](http://ubuntuhandbook.org/index.php/2013/08/remove-old-kernels-from-ubuntu-13-04-13-10/)

## Top Monitoring 

### Signals 

All of the monitors discussed here allow you to send signals to running processes. Each of these signals has a specific function though some of them can be defined by the receiving program using signal handlers.

The separate kill command can also be used to send signals to processes outside of the monitors. The kill -l can be used to list all possible signals that can be sent. Three of these signals can be used to kill a process.

 - SIGTERM (15): Signal 15, SIGTERM is the default signal sent by top and the other monitors when the k key is pressed. It may also be the least effective because the program must have a signal handler built into it. The program's signal handler must intercept incoming signals and act accordingly. So for scripts, most of which do not have signal handlers, SIGTERM is ignored. The idea behind SIGTERM is that by simply telling the program that you want it to terminate itself, it will take advantage of that and clean up things like open files and then terminate itself in a controlled and nice manner.

- SIGKILL (9): Signal 9, SIGKILL provides a means of killing even the most recalcitrant programs, including scripts and other programs that have no signal handlers. For scripts and other programs with no signal handler, however, it not only kills the running script but it also kills the shell session in which the script is running; this may not be the behavior that you want. If you want to kill a process and you don't care about being nice, this is the signal you want. This signal cannot be intercepted by a signal handler in the program code

- SIGINT (2): Signal 2, SIGINT can be used when SIGTERM does not work and you want the program to die a little more nicely, for example, without killing the shell session in which it is running. SIGINT sends an interrupt to the session in which the program is running. This is equivalent to terminating a running program, particularly a script, with the Ctrl-C key combination.

### Summary Section

- us: userspace – Applications and other programs running in user space, i.e., not in the kernel.

- sy: system calls – Kernel level functions. This does not include CPU time taken by the kernel itself, just the kernel system calls.

- ni: nice – Processes that are running at a positive nice level.

- id: idle – Idle time, i.e., time not used by any running process.

- wa: wait – CPU cycles that are spent waiting for I/O to occur. This is wasted CPU time.

- hi: hardware interrupts – CPU cycles that are spent dealing with hardware interrupts.

- si: software interrupts – CPU cycles spent dealing with software-created interrupts such as system calls.

- st: steal time – The percentage of CPU cycles that a virtual CPU waits for a real CPU while the hypervisor is servicing another virtual processor.

### Process Section

Change the memory units (kb, mb, gb, etc) in the summary section with `E`. Change
units in the process section with `e`.

- PID - Process ID

- USER - the username of the process owner

- PR - the priority of the process

- NI - the nice number of the process

- VIRT - The total amount of virutal memory allocated to the process

- RES - residen size ( kb unless otherwise noted) of non-swapped physical memory consumed by a process.

- SHR - the amount of shared memrory in kb use by the process

- S - S – The status of the process. This can be R for running, S for sleeping, and Z for zombie. Less frequently seen statuses can be T for traced or stopped, and D for uninterruptable sleep.

- %CPU – The percentage of CPU cycles, or time used by this process during the last measured time period.

- %MEM – The percentage of physical system memory used by the process.

- TIME+ – Total CPU time to 100ths of a second consumed by the process since the process was started.

- COMMAND – This is the command that was used to launch the process.

### Links

- [4 open source tools for linux system monitoring](https://opensource.com/life/16/2/open-source-tools-system-monitoring)
- [How to change meminfo in top](http://unix.stackexchange.com/questions/105908/how-to-display-meminfo-in-megabytes-in-top)
- [Linux Performance Analysis in 60k Milliseconds](http://techblog.netflix.com/2015/11/linux-performance-analysis-in-60s.html)

