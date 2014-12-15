# Server

Notes on server setup, security, best practices, and scripts.

## Security

### Change root password.  

Make it long and complex.  You will only need this if you lose the ability to log in over ssh or lose your sudo password. 

	passwd

### Update Package Cache

	apt-get update
	apt-get upgrade

### Install Fail2Ban 

Monitors login attempts to a server and block suspicious activity as it occurs. 

	apt-get install fail2ban

### Add a User

	useradd <user-name>
	mkdir /home/<user-name>
	mkdir /home/<user-name>.ssh
	chmod 700 /home/<user-name>.ssh

### Require Public Key Authentication

Force SSH keys to be used. 
Add the public keys of the users into this file. 

	cat id_rsa.pub >> /home/<user-name>/.ssh/authorized_keys
	// or
	vim /home/<user-name>/.ssh/authorized_keys

	chmod 400 /home/<user-name>/.ssh/authorized_key
	chown <user-name>:<user-name> /home/<user-name> -R

### Test the User & Enable Sudo

Set the sudo password. 

	passwd <user-name>

	visudo

All sudo access to the user if they enter the proper password. 

	root		ALL=(ALL) ALL
	<user-name> ALL=(ALL) ALL

### Lock Down SSH

Configure ssh to prevent password & root logins. And allow login from certain IPs. 

	vim /etc/ssh/sshd_config

	PermitRootLogin no
	PasswordAuthentication no
	AllowUsers <user-name>@<ip-address> <user-name>@<another-ip-if-any>

Restart SSH

	services ssh restart

### Firewall

Ubuntu comes with `ufw`

	ufw allow from <ip-address> to any port 22
	ufw allow 80
	ufw allow 443
	ufw enable

### IPTables

iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT  # accept connections is in an ESTABLISHED or RELATED state
iptables -A INPUT -p tcp --tcp-flags ALL NONE -j DROP             # drop tcp connections with NONE flag explicitly set
iptables -A INPUT -p tcp ! --syn -m state --state NEW -j DROP     # drop tcp connects with the SYN bit set not in a new connection state
iptables -A INPUT -p tcp --tcp-flags ALL ALL -j DROP              # drop tcp connections with no flags
iptables -A INPUT -i lo -j ACCEPT                                 # accept connections on the loopback interface
iptables -A INPUT -p tcp -m tcp --dport [whatever] -j ACCEPT      # accept connections to a specific port
iptables -P OUTPUT ACCEPT                                         # default output policy, accept
iptables -P INPUT DROP                                            # default input policy, drop
iptables-save > /etc/iptables.up.rules                            # save iptables rules to file

vi /etc/network/if-pre-up.d/iptables                              # create an ifup script to restore iptables

#!/bin/sh
	/sbin/iptables-restore < /etc/iptables/.up.rules
	
	chmod +x /etc/network/if-pre-up.d/iptables                       # make sure script is executable>

### Enable Automatic Security Updates

	apt-get install unattended-upgrades
	
	vim /etc/apt/apt.conf.d/10periodic

	APT::Periodic::Update-Package-Lists "1";
	APT::Periodic::Download-Upgradeable-Packages "1";
	APT::Periodic::AutocleanInterval "7"
	APT::Periodic::Unattended-Upgrade "1";

	vim /etc/apt/apt.conf.d/50unattended-upgrades

	Unattended-Upgrade::Allowed-Origins {
		"Ubuntu lucid-security";
	//	"Ubuntu lucid-updates";
	};

### Install Logwatch

Monitors your logs and emails them to you. 

	apt-get install logwatch

	vim /etc/cron.daily/001logwatch

	/usr/sbin/logwatch --output mail --mailto <email@address> --detail high

### Install Fail2Ban

	sudo apt-get install fail2ban 

## Links

- [My First 5 Minutes On A Server; Or, Essential Security for Linux Servers](http://plusbryan.com/my-first-5-minutes-on-a-server-or-essential-security-for-linux-servers)

