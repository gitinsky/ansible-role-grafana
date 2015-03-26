# -*- mode: ruby -*-
# vi: set ft=ruby :

defaultbox = "ubuntu/precise64"
box = ENV['BOX'] || defaultbox

ENV['ANSIBLE_ROLES_PATH'] = "../../roles"

Vagrant.configure(2) do |config|

  config.vm.box = box
  
  config.vm.define "grafana" do |grafana_cfg|
    grafana_cfg.vm.network "private_network", type: "dhcp"
    grafana_cfg.vm.network :forwarded_port, host: 6067, guest: 6067
    grafana_cfg.vm.network :forwarded_port, host: 6068, guest: 6068
    grafana_cfg.vm.provider :virtualbox do |v|
      v.name = "grafana"
      # v.gui = true
    end
  end
  
  config.vm.provision :ansible do |ansible|
    ansible.playbook = "examples/grafana.yml"
    ansible.sudo = true
    # ansible.tags = ['debug']
    ansible.groups = {
      "grafana-hosts" => ["grafana"],
    }
    ansible.extra_vars = {
      ansible_ssh_user: 'vagrant',
      hbase_standalone:   true,
      grafana_http_port:  6067,
      grafana_https_port: 6068,
    }

  end

end
