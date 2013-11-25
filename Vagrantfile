# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"  
#  config.vm.network :forwarded_port, guest: 80, host: 8080
#  config.vm.network :forwarded_port, guest: 3306, host: 3306
  
  config.vm.network :private_network, ip: '192.168.2.22'
  
  #config.vm.synced_folder "public_html", "/public_html", :create => "true" 

	
#	config.vm.provision "chef_solo", run_list: ["my_cookbook"]
	
	config.vm.provision :chef_solo do |chef|
         chef.cookbooks_path = "data/vm/cookbooks"
		 chef.add_recipe"zend-server"
         chef.log_level = :debug
         
end
	
end