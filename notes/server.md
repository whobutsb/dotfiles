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

## Links

- [My First 5 Minutes On A Server; Or, Essential Security for Linux Servers](http://plusbryan.com/my-first-5-minutes-on-a-server-or-essential-security-for-linux-servers)

