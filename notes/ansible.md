# [Ansible](https://ansibleworks.com)

### Installing Ansible

Install apt-get repo, update, and download ansible.

    #!/usr/bin/env bash

    echo ">>> Installing ansible";

    # Install software-properties-common
    sudo apt-get install -y software-properties-common

    # Add repository
    sudo apt-add-repository -y ppa:ansible/ansible
    sudo apt-get update

    # Install ansible
    sudo apt-get install -y ansible

Ping the server

    $ ansible all -m ping
    
To define a user, if running locally like on vagrant, then run

   ansible all -m ping -s -k -u vagrant 
 
    - `all` - use all defined servers from inventory
    - ` -m ping` - use the ping module 
    - `-s` - use 'sudo'
    - `-k` - ask for a password rather than ssh key (vagrant)
    - `-u vagrant` - login to the server using user vagrant

### Running arbitary commands

    ansible all -s -m shell -a 'apt-get install nginx'

    - `-m` - module
    - `-a` - argument flag for the module

### Running playbooks

    ansible-playbook -s <playbook.yml>

running locally

    ansible-playbook -s -k -u vagrant nginx.yml

#### Basic Playbook File for `nginx.yml`

    - hosts: local
      tasks:
        - name: Install Nginx
          apt: pkg=nginx state=installed update_cache=true
          notify: 
            - Start Nginx

      handlers: 
      - name: Start Nginx
        service: name=nginx state=started
    
    

## Links
- [Servers for Hackers - Ansible Tutorial](https://serversforhackers.com/an-ansible-tutorial)