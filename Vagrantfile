
Vagrant.configure(2) do |config|

  config.vm.box = "chef/centos-6.5"

  config.vm.hostname = "careers.dev"

  config.vm.provision :shell, path: "scripts/base.sh"
  config.vm.provision :shell, path: "scripts/hostname.sh", args: [config.vm.hostname]
  config.vm.provision :shell, path: "scripts/php.sh"
  config.vm.provision :shell, path: "scripts/composer.sh"
  config.vm.provision :shell, path: "scripts/phpunit.sh"
  config.vm.provision :shell, path: "scripts/phing.sh"
  config.vm.provision :shell, path: "scripts/apache.sh"
  config.vm.provision :shell, path: "scripts/mysql.sh"

  config.vm.network "private_network", ip: "33.33.33.100"

  config.vm.synced_folder "careers", "/careers"

  config.vm.box_check_update = false

  config.ssh.forward_agent = true

  config.vm.provider :virtualbox do |v|
    v.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/v-root", "1"]

    v.memory = 1024
    v.cpus = 2
  end

end
