# -*- mode: ruby -*-
# vi: set ft=ruby

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"

  config.vm.provider "virtualbox" do |v|
    v.memory = 6144
    v.cpus = 4
  end

  config.vm.network "private_network", ip: "192.168.50.200"

  config.vm.provision :shell, :path => "install_docker.sh"
end

