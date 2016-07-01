[Source](http://www.codelitt.com/blog/my-first-10-minutes-on-a-server-primer-for-securing-ubuntu/ "Permalink to My First 10 Minutes On a Server")

# My First 10 Minutes On a Server

[My First 5 Minutes on a Server][1], by Bryan Kennedy, is an excellent intro into securing a server against most attacks. We have a few modifications to his approach that we wanted to document as part of our efforts of [externalizing our processes and best practices][2]. We also wanted to spend a bit more time explaining a few things that younger engineers may benefit from.

I check our logwatch email every morning and thoroughly enjoy watching several hundreds (sometimes 1000s) of attempts at gaining access with little prevail. (Many are rather unimaginative such as trying `root` with password `1234` over and over again). This general overview works for Debian/Ubuntu servers which are our personal favourite choice. These usually only serve as hosts for docker containers, but principles still apply. We'll go more in depth in locking down a server specifically for use as a Docker host another time.

On large scale, you'll be better off with a full automated setup using something like [Ansible][3] or [Shipyard][4] however sometimes you're just creating a single server or working on a base for an Ansible recipe which is what this is meant to cover.

**Disclaimer: This is meant to serve as a primer and a base. You should extend upon it as your needs dictate**

### First things first

We don't even have a password for our root user yet. We'll want to select something random and complex. We use a password manager's password generater set to the most difficult setting. The PW manager saves the password and it is encrypted with access only given by a long master password. A couple of redundancies are provided here (long, complex, random password + password is stored behind encryption/another long password). Whether you use a PW manager or some other means, keep this safe and behind some form of encryption. You'll only need this root password if you lose your sudo password.

`# passwd`

_*Note: There's a lot of discussion going on both [HN][5] and [Reddit][6] on root passwords. It's worth a read._

Next you'll need to update the repositories and upgrade your system applying the latest patches. We'll have a section for how to automate security upgrades later on.

    apt-get update
    apt-get upgrade

### Add your user

You should never be logging on to a server as root. We follow a similar convention as Bryan in our user name, but you could use whatever convention you'd like. With a small team, having one login user hasn't been an issue for us, but with a larger team best practice would dictate that different users would be setup with different levels of permission only granting sudo permissions to a select few.

    useradd deploy
    mkdir /home/deploy
    mkdir /home/deploy/.ssh
    chmod 700 /home/deploy/.ssh

Setup your prefered shell for the deploy user, here we use bash:

    usermod -s /bin/bash deploy

Remember `chmod 700` means that owner can read, write, execute. We're still root but in a minute we'll recursively `chown` this folder for the deploy user and deploy group. Only this user should have access to do anything with the .ssh folder.

### Require ssh key authentication

We tend to avoid passwords for logging into servers. There was a lot of [discussion][7] around this after Bryan's original guide came out, but I tend to fall into this camp as well. Here are a few notes on this:

1. ssh keys are better than passwords only because they contain and require more information.
2. Passwords can be brute forced. Guessing a public key is so essentially impossible that they can be considered perfectly secure
3. What about a stolen machine? Yes, they have your private key, but expiring an ssh-key is easy, just remove the public key from authorized_keys. You should also have your private key protected by a secure and long passphrase. See next point.
4. All of this works, AS LONG AS YOU HAVE A LONG AND SECURE PASSPHRASE PROTECTING YOUR KEY. Repeated because it's bloody important.

So let's make password authentication a thing of the past on our server. Copy the contents of your `id_rsa.pub`1 on your local machine to your servers authorized keys file.

    vim /home/deploy/.ssh/authorized_keys

Let's set the right permissions based on the Linux security [principal of least privilege][8]:

    chmod 400 /home/deploy/.ssh/authorized_keys
    chown deploy:deploy /home/deploy -R

`chmod 400` sets permissions so that the file can be read by owner. The second command, `chown` makes the user deploy and group deploy owners (recursively) of their home directory. We referenced this earlier in when setting read/write/execute permissions to owner for this directory.

We're going to come back in a second after we've properly tested our deploy user and sudo to disable logging in as the root user and enforce ssh key logins only.

### Test `deploy` user and setup sudo

We're going to test logging in as deploy, while keeping our ssh connection as `root` open just in case. If it works, we'll use our open connection as `root` user to set a password for deploy. Since we're disabling password logins, this password will be used when sudo-ing. Again we use a pw manager to create a complex and random password, saving it behind an encrypted wall, and sharing it among the team (syncing the encrypted pw file).

    passwd deploy

Setting up sudo is simple. Open up the sudo file with:

    visudo

Add the `%sudo` group below the `root` user as shown below. Make sure to comment out any other users and groups with a `#`. (users have no prefix and groups start with `%`.) Most fresh installs won't have any there, but just make sure.

    root    ALL=(ALL) ALL
    %sudo   ALL=(ALL:ALL) ALL

Then add `deploy` user to the `sudo` group.

    usermod -aG sudo deploy

`deploy` now has access to sudo permissions. Now normally you need exit and re-login to the shell in order to start having access to the group's permissions. There's a little trick though to prevent having to do that:

    exec su -l deploy

This starts a new interactive shell for the `deploy` user with the new permissions to the `sudo` group. It will require your `deploy`'s password, but feels faster than logging out and logging back in.

_EDIT NOTE: Thanks to [ackackacksyn][9] on Reddit for pointing out that you should not add users directly to sudoers. Thanks to [FredFS456][10] in /r/netsec for pointing out you need to logout and log back in for group permissions to take effect._

### Enforce ssh key logins

ssh configuration for the machine is stored here:

    vim /etc/ssh/sshd_config

You'll want to change these lines (or add if missing) in the file to match below. I think they're pretty self-explanatory. You'll want to add the IP that you use to connnect. We have a company VPN setup with OpenVPN with cryptographic authentication so in order to connect to a server, you must also be authenticated and connected to the VPN.

    PermitRootLogin no
    PasswordAuthentication no
    AllowUsers deploy@(your-VPN-or-static-IP)
    AddressFamily inet

Enable all these rules by restarting the ssh service. You'll probably need to reconnect (do so by using your deploy user!)

    service ssh restart

_*Note: Thanks to [raimue][11] and mwpmaybe on HN for pointing out that [fail2ban (installed later) does not support IPv6 right now][12], so I added `AddressFamily inet` to the `sshd_config` file which will only allow IPv4 which fail2ban does support._

### Setting up a firewall

There are usually two camps. Those who use IPtables directly and those who use a handy interface called `ufw` which is a layer on top of IPtables meant to simplify things. Simple is generally better with security. The [DigitalOcean ufw][13] is really good and goes over the basics.

`ufw` is installed by default on Ubuntu and is just an `apt-get install ufw` away on Debian.

By default `ufw` should deny all incoming connections and allow all outgoing connections, however, it won't be running (because otherwise how would you be connected?). We'll go through and explicitly allow the connections that we deem okay.

First we'll want to make sure that we are supporting IPv6. Just open up the config file.

    vim /etc/default/ufw

Set IPv6 to yes.

    IPV6=yes

For the rest of the ports that we're going to open up, we can just use the ufw tool from command line which is very handy.

    sudo ufw allow from {your-ip} to any port 22
    sudo ufw allow 80
    sudo ufw allow 443
    sudo ufw disable
    sudo ufw enable

The first one is a redundancy measure that makes sure that only connections from our IP can connect via SSH (standard SSH port).2 While the second and third open up http and https traffic.

NOTE: Thanks to [chrisfosterelli][14] for pointing out that if you're going to set up the first rule (and you should), make sure you have a static IP or secure VPN that you connect to. A dynamic IP will leave you locked out of your box some day in the future.

### Automated security updates

I like these. They're not perfect, but it's better than missing patches as they come out.

    apt-get install unattended-upgrades

    vim /etc/apt/apt.conf.d/10periodic

Update this file to match this:

    APT::Periodic::Update-Package-Lists "1";
    APT::Periodic::Download-Upgradeable-Packages "1";
    APT::Periodic::AutocleanInterval "7";
    APT::Periodic::Unattended-Upgrade "1";

I generally agree with Bryan that you'll want to disable normal updates and only enable security updates. The idea here is that you don't want an application going down without you knowing about it because some package was updated that it relies on while security patches very rarely create dependency nightmares at an application level.

    vim /etc/apt/apt.conf.d/50unattended-upgrades

Make the file look like this:

    Unattended-Upgrade::Allowed-Origins {
        "Ubuntu lucid-security";
        //"Ubuntu lucid-updates";
    };

You're all set.

### fail2ban

![Banned gif][15]

fail2ban is a great package that actively blocks suspicious activity as it occurs. From their [wiki][16] Fail2ban scans log files (e.g. `/var/log/apache/error_log`) and bans IPs that show the malicious signs -- too many password failures, seeking for exploits, etc... It does this by adding rules to `iptables`.

Out of the box Fail2Ban comes with filters for various protocols (HTTPS, STMP, SSH, etc). It also has integration with a lot of services like [Apache][17] and [Nginx][18] which can provide a certain level of DDoS or brute force attack protection. You'll want to be careful with using it in this way though because depending on the IP address where the DDoS is coming from, you could lock out real users for a time as well. It offers a lot of configuration options including integration with SendMail to notify you when an IP gets banned. Feel free to take a look at some of the links and see if any of the other options interest you.

We're just going to install it and leave the default settings for SSH as a base starting point though:

    apt-get install fail2ban

### 2 Factor Authentication

2FA is not optional for us when building anything that has very sensitive requirements. Theoretically, if you're enforcing 2FA (on top of all these other measures), then in order to gain access to your server (baring application vulnerabilities), the attacker would have to have:

1. Access to your certificate and key to access VPN
2. Access to your computer to have your private key
3. Access to your passphrase for your private key
4. Access to your phone for 2FA

These are quite a few hurdles to jump. Even then to gain root access via sudo they'd have to have deploy's password that is stored behind AES encryption (5).

Install this package

    apt-get install libpam-google-authenticator

Set up by running this command and following the instructions:

    su deploy
    google-authenticator

2FA is very easy and adds a great layer of security.

### Logwatch

This is really more of a simple pleasure and a monitoring tool that helps you see what's going on after the fact. Logwatch monitors your logfiles and when configured sends you a daily email with the information parsed very nicely. The output is quite entertaining to watch and you'll be surprised at how many attempts are made every day to gain access to your server. I install it if for no other reason than to show the team how important good security is.

There's a great writeup by [DigitalOcean on Logwatch install and config][19], but if we're keeping to 10 minutes we'll just install it and run a cron job to run it and email us daily.

    apt-get install logwatch

Add a cron job

    vim /etc/cron.daily/00logwatch

Add this line to the cron file:

    /usr/sbin/logwatch --output mail --mailto you@example.com --detail high

### All done

There you are. Your main concern and point of vunerability after completing this will be your application and services. These are another animal entirely though.

We're making a big push to externalize our processes and best practices, if you're interested in learning more take a look at our [repository][2]. We open source all of our policies and best practices as well as continue to add to them there.

Have suggestions or questions? Comment below or submit a PR/issue on the Github repo! There are also a lot of really good bits of info [on the Hacker News thread][5] and [/r/netsec][6]

* * *

Want to find out when we release a new article?

* * *

[1]: http://plusbryan.com/my-first-5-minutes-on-a-server-or-essential-security-for-linux-servers
[2]: https://github.com/codelittinc/incubator-resources
[3]: https://github.com/ansible/ansible
[4]: https://shipyard-project.com/
[5]: https://news.ycombinator.com/item?id=11909543
[6]: https://www.reddit.com/r/netsec/comments/4o7wpo/my_first_10_minutes_on_a_server/
[7]: https://news.ycombinator.com/item?id=5316691
[8]: https://en.wikipedia.org/wiki/Principle_of_least_privilege
[9]: https://www.reddit.com/r/netsec/comments/4o7wpo/my_first_10_minutes_on_a_server/d4aeajf
[10]: https://www.reddit.com/r/netsec/comments/4o7wpo/my_first_10_minutes_on_a_server/d4br5q6
[11]: https://news.ycombinator.com/item?id=11910321
[12]: https://github.com/fail2ban/fail2ban/issues/1123
[13]: https://www.digitalocean.com/community/tutorials/how-to-setup-a-firewall-with-ufw-on-an-ubuntu-and-debian-cloud-server
[14]: https://news.ycombinator.com/item?id=11910341
[15]: https://avatars1.githubusercontent.com/u/1087378?v=3&amp;s=200
[16]: http://www.fail2ban.org/wiki/index.php/Main_Page
[17]: https://www.digitalocean.com/community/tutorials/how-to-protect-an-apache-server-with-fail2ban-on-ubuntu-14-04
[18]: https://www.digitalocean.com/community/tutorials/how-to-protect-an-nginx-server-with-fail2ban-on-ubuntu-14-04
[19]: https://www.digitalocean.com/community/tutorials/how-to-install-and-use-logwatch-log-analyzer-and-reporter-on-a-vps
[20]: http://disqus.com/?ref_noscript
[21]: http://disqus.com
  
