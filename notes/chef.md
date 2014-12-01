# Chef

## Knife Commmands


Bootstrapping a node

	knife bootstrap [ip] --sudo -x [user] -N [node-name]

Bootstrapping to a Vagrant Machine

	knife bootstrap localhost --sudo -x vagrant -P vagrant --ssh-port 2222 -N node1

Getting help 

	knife help [command]

Searching for cookbooks

	knife cookbook site search [cookbook]

Downloading from cookbooks

	knife cookbook site download [cookbook]

### Vagrant Provisioning

Vagrant Provisioning Configuration
	  
	config.vm.provision "chef_client" do |chef|
		chef.chef_server_url = "https://api.opscode.com/organizations/customchannels"
		chef.validation_key_path = "/Users/stevebarbera/Sites/Chef/.chef/customchannels-validator.pem"
		chef.validation_client_name = "customchannels-validator"
		chef.node_name = "vagrant-node"
		chef.delete_node = true
		chef.delete_client = true
	end

### Recipes

Removing a package

	package 'apache2' do 
		action :remove
	end

### Adding and Creating an encrypted data bag for passwords 

- Create an encryption key
	
		openssl rand -base64 512 | tr -d 'rn' > ~/.chef/encrypted_data_bag_secret
		chmod 600 ~/.chef/encrypted_data_bag_secret

- Make sure to add the data bag encryption key to `knife.rb`

		encrypted_data_bag_secret "#{current_dir}/encrypted_data_bag_secret"

- Create a new encrypted data bag item for storing passwords: 

		knife data bag create --secret-file ~/.chef/encrypted_data_bag_secret secrets mysql 

- Example 

		{
			"id": "mysql", 
			"prod": {
				"root": "password", 
				"repl": "password", 
				"debian": "password"
			},
			"dev": {
				"root": "password", 
				"repl": "password", 
				"debian": "password"
			}
		}

After saving and closing the knife will automatically encrypt the data bag item and upload it to the chef server. 

- Store the encrypted data bag in version control 

		mkdir -p data_bags/secrets
		knife data bag show secrets mysql -Fj > data_bags/secrets/mysql.json

- View and decrypt the data bag file 

		knife data bag show secrets mysql --secret-file ~/.chef/encrypted_data_bag_secret

- Edit the Data bag file 

		knife data bag edit --secret-file ~/.chef/encrypted_data_bag_secret secrets mysql 

- Use the passwords in a recipes.  

Example file `cookbooks/mysql/recipes/server.rb`

		# Customization get passwords from encrypted data bag
		secrets = Chef::EncryptedDataBagItem.load('secrets", "mysql")
		if secrets && mysql_passwords = secrets[node.chef_environment]
			node['mysql']['server_root_password'] = mysql_passwords['root']
			node['mysql']['server_debian_password'] = mysql_passwords['debian']
			node['mysql']['server_repl_password'] = mysql_passwords['repl']
		end

## Links

- [The Enviroment Cookbook Pattern](http://blog.vialstudios.com/the-environment-cookbook-pattern/)
- [Writing Your First Chef Recipe](http://reiddraper.com/first-chef-recipe/)
- [Provisioning a LAMP Stack](http://www.jasongrimes.org/2012/06/provisioning-a-lamp-stack-with-chef-vagrant-and-ec2-2-of-3/)

![Knife Cheat Sheet](http://docs.getchef.com/_images/qr_knife_web.png)


