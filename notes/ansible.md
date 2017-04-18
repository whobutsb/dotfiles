# [Ansible](https://ansibleworks.com)

## Generating Password for the User Module

    openssl passwd -salt <salt> -1 <plaintext-password>

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

### Debugging a command

    - debug: var=playbook_dir

    - debug: var=item
      with_items: ec2.instances

### Running arbitary commands

    ansible all -s -m shell -a 'apt-get install nginx'

    - `-m` - module
    - `-a` - argument flag for the module

### Getting facts on a host

    ansible [host-group || all] -m setup --tree /tmp/facts -i /path/to/inventory (optional filter: -a 'filter=ansible_*')

### Running playbooks

    ansible-playbook -i /path/to/inventory playbook.yml

Running a playbook with vault contents

  ansible-playbook -i /inventory/file /playbook/file.yml --ask-vault-pass

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

### Encrypting a file with ansible-vault

    ansible-vault encrypt /path/to/file


## Modules

#### lineinfile

#  - name: create a complete empty file
#    command: /usr/bin/touch /test/test.conf

- name: create a new file with lineinfile
  lineinfile: dest=/test/test.conf 
  regexp='^' line=''
  state=present
  create=True

- name: add a string to the new file
  lineinfile: dest=/test/test.conf
  regexp='^'
  line='Hello, World!'
  state=present

- name: add a multiline string to the file and delete the string from before
  # Be aware, with the given regex the string will be added everytime the playbook runs 
  lineinfile: dest=/test/test.conf 
  regexp='^'
  line='#This is a comment\n#Another comment\n#Another comment, again\n#Again a comment\n#The last comment'
  state=present

- name: add a single line, in this case the same as the comment but uncommented
  lineinfile: dest=/test/test.conf 
  regexp='^Another'
  insertafter='^#Another'
  line='Another comment, no longer a comment'
  state=present

- name: remove the line '#Again a comment'
  lineinfile: dest=/test/test.conf 
  regexp='^#Again'
  state=absent

- name: add a new string at the beginning of the file
  lineinfile: dest=/test/test.conf
  regexp='^This'
  insertbefore=BOF
  line='This is no longer a comment'

- name: add a new string before the match
  lineinfile: dest=/test/test.conf 
  regexp='^Another'
  insertbefore='^#Another'
  line='Another comment, no longer'

- name: add a new string at the end of the file
  lineinfile: dest=/test/test.conf 
  regexp=''
  insertafter=EOF
  line='The latest entry'
   
## Links
- [Servers for Hackers - Ansible Tutorial](https://serversforhackers.com/an-ansible-tutorial)
- [A Practical Introduction to Ansible](https://github.com/afroisalreadyinu/practical-ansible-intro)
- [Ansible 101](https://medium.com/@denot/ansible-101-d6dc9f86df0a)
- [10 Best Practices for Ansible](http://www.theodo.fr/blog/2015/10/best-practices-to-build-great-ansible-playbooks/)
