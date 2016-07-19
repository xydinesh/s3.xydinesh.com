# -*- mode: ruby -*-
# vi: set ft=ruby :
# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "bento/ubuntu-16.04-i386"
    config.vm.network :forwarded_port, guest: 4000, host: 4000
  # config.vm.network :forwarded_port, guest: 27017, host: 27017
  config.vm.provider :virtualbox do |vb|
    # Use VBoxManage to customize the VM. For example to change memory:
    vb.customize ["modifyvm", :id, "--memory", "2048"]
  end
  # config.vm.provision :shell do |s|
  #  s.privileged = false
  #  s.path = "vagrant_bootstrap.sh"
  # end
end
