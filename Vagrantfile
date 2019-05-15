IMAGE_NAME = "bento/ubuntu-16.04"
N = 2

Vagrant.configure("2") do |config|
    config.ssh.insert_key = false

    if (/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM) != nil
		config.vm.synced_folder ".", "/vagrant", mount_options: ["dmode=700,fmode=600"]
	else
		config.vm.synced_folder ".", "/vagrant"
	end

    config.vm.provider "virtualbox" do |v|
        v.memory = 2048
        v.cpus = 2
    end
        config.vm.define "manager" do |manager|
        manager.vm.box = IMAGE_NAME
        manager.vm.network "private_network", ip: "10.29.11.10"
        manager.vm.hostname = "manager"
        manager.vm.provision :shell, path: "scripts/install-ansible.sh"
		manager.vm.provision :shell, path: "scripts/install-docker.sh"
    end
	
	config.vm.define "node-1" do |node1|
        node1.vm.box = IMAGE_NAME
        node1.vm.network "private_network", ip: "10.29.11.20"
        node1.vm.hostname = "node1"
    end
    config.vm.define "node-2" do |node2|
        node2.vm.box = IMAGE_NAME
        node2.vm.network "private_network", ip: "10.29.11.30"
        node2.vm.hostname = "node2"
    end
end