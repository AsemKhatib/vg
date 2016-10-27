# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

    config.vm.box = "scotch/box"
    #config.ssh.username = 'vagrant'
    #config.ssh.password = 'vagrant'
    config.ssh.insert_key = false
    config.vm.network "private_network", ip: "192.168.33.30"
    config.vm.hostname = "vg"
    config.vm.synced_folder ".", "/var/www", :nfs => { :mount_options => ["dmode=777","fmode=666"] }

	config.vm.provider "virtualbox" do |v|
		v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
		v.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
        v.memory = 1536
        v.cpus = 2
    end
	
	config.vm.provision "Provisioning", type: "shell", path: "vagrant_bootstrap/bootstrap.sh"
	config.vm.provision "shell", inline: "cd /var/www/system && . backup.sh", run: "always"
end
