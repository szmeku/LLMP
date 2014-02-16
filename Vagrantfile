# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|


  # 32 BIT
  #config.vm.box = "debian32"
  #config.vm.box_url = "http://puppet-vagrant-boxes.puppetlabs.com/debian-73-i386-virtualbox-puppet.box"

  # 64 BIT  
  config.vm.box = "debian64"
  config.vm.box_url = "http://puppet-vagrant-boxes.puppetlabs.com/debian-73-x64-virtualbox-puppet.box"

  config.vm.network :private_network, ip: "192.168.33.10"
  # config.vm.synced_folder "../../projects", "/home/vagrant/projects"

  config.vm.synced_folder "../../projects", "/home/vagrant/projects",
    id: "vagrant-root",
    owner: "vagrant",
    group: "www-data",
    mount_options: ["dmode=775,fmode=664"]


  config.vm.provider :virtualbox do |vb|
  #   vb.gui = true
     vb.customize [
      "modifyvm", :id,

      # older cpus
      #"--hwvirtex", "off",

      "--memory", "2048"]
  end
  
  config.vm.provision :puppet do |puppet|
		puppet.manifests_path = 'puppet/manifests'
		puppet.manifest_file = 'main.pp'
		puppet.module_path = 'puppet/modules'
    puppet.options = "--verbose --debug"
	end
end
