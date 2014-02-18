# -*- mode: ruby -*-
# vi: set ft=ruby :

# Requires us to run `vagrant plugin install vagrant-chef-zero` beforehand
Vagrant.require_plugin "vagrant-chef-zero"

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Requires us to run `vagrant box add precise64 http://files.vagrantup.com/precise64.box` beforehand
  config.vm.box = "precise64"
  config.vm.network :forwarded_port, guest: 3000, host: 30000
  config.vm.network :private_network, ip: "192.168.33.10"
  config.ssh.forward_agent = true
  config.vm.synced_folder ".", "/uiharu"

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "1024"]
  end

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "chef-repository/cookbooks"
    chef.run_list = [
        "apt"
    ]
    chef.json = {}
  end
end
