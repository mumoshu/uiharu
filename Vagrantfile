# -*- mode: ruby -*-
# vi: set ft=ruby :

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

  config.vm.provision :shell, :inline => 'apt-get update'
  config.vm.provision :shell, :inline => 'apt-get install build-essential ruby1.9.1-dev --no-upgrade --yes'
  config.vm.provision :shell, :inline => "gem install chef --version 11.4.2 --no-rdoc --no-ri --conservative"

  config.vm.provision :chef_solo do |chef|
    chef.add_recipe 'nginx'
    chef.json = {
      :rvm => {
        :default_ruby => 'ruby-2.1.0-p0',
        :vagrant => {
            :system_chef_solo => '/opt/chef/bin/chef-solo'
        },
      },
      :nginx => {
        :version => '1.4.1',
        :dir => '/etc/nginx',
        :log_dir => '/var/log/nginx',
        :binary => '/opt/nginx-1.4.1/sbin',
        :user => 'vagrant',
        :init_style => 'init',
        :source => {
          :modules => %w(http_stub_status_module http_ssl_module http_gzip_static_module passenger)
        },
        :passenger => {
          :version => '3.0.21',
          :ruby => '/usr/local/rvm/rubies/ruby-2.1.0-p0/bin/ruby',
          :root => '/usr/local/rvm/gems/ruby-2.1.0-p0/gems/passenger-3.0.21'
        }
      }
    }
  end
end
