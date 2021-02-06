Vagrant.configure("2") do |config|
    config.vm.box = "ubuntu/bionic64"
    config.vm.provider "virtualbox" do |vb|
        vb.memory = 512
        vb.cpus = 1
    end

    config.vm.define "master" do |m|
        m.vm.provider "virtualbox" do |vb|
            vb.name = "master"
        end
        m.vm.network "public_network", bridge: "Intel(R) Dual Band Wireless-AC 8265", ip: "192.168.0.10"
        m.vm.provision "shell",
            inline: "cat /vagrant/cert/public.pub >> .ssh/authorized_keys && \
                    apt-get update && apt-get install -y ansible && \
                    sudo ln -s /usr/bin/python3 /usr/bin/python"
    end

    config.vm.define "slave1" do |m|
        m.vm.provider "virtualbox" do |vb|
            vb.name = "slave1"
            vb.memory = 1024
        end
        m.vm.network "public_network", bridge: "Intel(R) Dual Band Wireless-AC 8265", ip: "192.168.0.11"
        m.vm.provision "shell",
            inline: "cat /vagrant/cert/public.pub >> .ssh/authorized_keys && \
                    apt-get update && \
                    sudo ln -s /usr/bin/python3 /usr/bin/python"
    end

    config.vm.define "slave2" do |m|
        m.vm.provider "virtualbox" do |vb|
            vb.name = "slave2"
            vb.memory = 1024
        end
        m.vm.network "public_network", bridge: "Intel(R) Dual Band Wireless-AC 8265", ip: "192.168.0.12"
        m.vm.provision "shell",
            inline: "cat /vagrant/cert/public.pub >> .ssh/authorized_keys && \
                    apt-get update && \
                    sudo lb -s /usr/bin/python3 /usr/bin/python"
    end
end