# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = "puppetlabs/ubuntu-14.04-64-puppet"
  config.vm.provision :puppet do |puppet|
    puppet.environment_path = "environments"
    puppet.environment = "meethere"
  end

  config.vm.network "forwarded_port", guest: 8080, host: 8080
  config.vm.network "public_network"

  config.vm.synced_folder ".", "/vagrant", disabled: true
  config.vm.synced_folder "../backend", "/code/meet_here/backend", create: true
  config.vm.synced_folder "../frontend", "/code/meet_here/frontend", create: true
  config.vm.synced_folder "./shared", "/shared/", create: true

  # for defining a name
  config.vm.define "meet_here"

  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    # comment the following line if there are too many DNS lookups
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
  end

end
