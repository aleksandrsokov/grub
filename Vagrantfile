# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/focal64"
  config.vm.box_check_update = false
  config.vm.hostname = "grub"
  config.vm.network "public_network", ip:"192.168.0.176"

  (0..4).each do |i|
      config.vm.disk :disk, size: "250MB", name: "disk-#{i}"
    end
 
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "4096"
    vb.cpus = "2"
   end



  config.vm.provision "shell", inline: <<-SHELL
    mkdir -p ~root/.ssh
    cp ~vagrant/.ssh/auth* ~root/.ssh
    sudo sed -i 's/\PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
    systemctl restart sshd
   SHELL
  config.vm.provision "shell", path: "grub.sh"

end