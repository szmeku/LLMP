# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|


  # 32 BIT
  # config.vm.box = "ubuntu32"

  # 64 BIT  
  config.vm.box = "ubuntu64"

  config.vm.network :private_network, ip: "192.168.33.10"

  config.vm.network "forwarded_port", guest: 80, host: 80
  config.vm.network "forwarded_port", guest: 3360, host: 3360

  # config.vm.synced_folder "../../projects", "/home/vagrant/projects"

  config.vm.synced_folder "../projects", "/home/vagrant/projects",
    id: "vagrant-root",
    owner: "vagrant",
    group: "www-data",
    mount_options: ["dmode=775,fmode=664"]


  config.vm.provider :virtualbox do |vb|
     
	#vb.gui = true,
     vb.customize [
      "modifyvm", :id,

      # older cpus
      # "--hwvirtex", "off",

      # many cpus
      "--cpus", "2",
      "--ioapic", "on",

      # "--memory", "2048"
      "--memory", "3072"
    ]
  end
  
  config.vm.provision :puppet do |puppet|
		puppet.manifests_path = 'puppet/manifests'
		puppet.manifest_file = 'main.pp'
		puppet.module_path = 'puppet/modules'
    puppet.options = "--verbose --debug"
	end
end
