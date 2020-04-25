# -*- mode: ruby -*-
# vi: set ft=ruby :

install_deps = <<-'SCRIPT'
sudo -E apt-get update
sudo -E apt-get install -y --no-install-recommends \
  curl \
  git \
  jq \
  mailutils \
  postfix
SCRIPT
install_hab_cli = <<-'SCRIPT'
adduser hab
curl https://raw.githubusercontent.com/habitat-sh/habitat/master/components/hab/install.sh | sudo bash
SCRIPT

Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-16.04"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "4096"
    vb.cpus = "4"
  end

  config.vm.provider "parallels" do |v|
    v.memory = "4096"
    v.cpus = "4"
    v.check_guest_tools = false
  end

  config.vm.provision "shell", inline: install_deps
  config.vm.provision "shell", inline: install_hab_cli
end
