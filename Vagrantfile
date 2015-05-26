# -*- mode: ruby -*-
# vi: set ft=ruby

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"

  config.vm.provider "virtualbox" do |v|
    v.memory = 6144
    v.cpus = 4
  end

  config.vm.network "private_network", ip: "192.168.50.200"

  config.vm.provision "docker" do |d|
  end

  config.vm.provision :shell, :inline => "apt-get install ruby -y"
  config.vm.provision :shell, :inline => "gem sources -r http://rubygems.org/ && gem sources -a https://rubygems.org/"
  config.vm.provision :shell, :inline => "gem install fige"
end

