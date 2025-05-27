# -*- mode: ruby -*-

Vagrant.configure('2') do |config|
  config.vm.provider "virtualbox"

  config.vm.synced_folder './', '/vagrant', type: "rsync", rsync__args: ["--verbose","--recursive","-K","--copy-links"], disabled: false

  config.vm.box = "debian/bullseye64"
  config.vm.provider "virtualbox" do |vb|
    vb.cpus = 8
    vb.memory = 4098
    vb.gui = true
  end

  # Use system network bridge interface
  bridge_host_interface_name = "Realtek PCIe 2.5GbE Family Controller"
  config.vm.network "public_network", bridge: bridge_host_interface_name, ip: "10.0.0.74"

  config.vm.define "ansibletest" do |ansibletest|
    ansibletest.vm.hostname = "ansibletest.localdomain" # be sure to add to DNS

    config.vm.provision "ansible" do |ansible|
        # ansible.verbose = "v"
        ansible.playbook = "playbooks/site.yaml"
        ansible.inventory_path = "inventory.yaml"
        ansible.limit = "ansibletest.localdomain"
    end

  end

end
