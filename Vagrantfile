IMAGE_NAME = "base-os-k8s"
NODE_NUM = 6
MASTERS_CPU = 1
MASTERS_MEM = 4048


IP_BASE = "192.168.100."
VM_NAME = "redis-server"


Vagrant.configure("2") do |config|
    (1..NODE_NUM).each do |i|
        config.vm.define "#{VM_NAME}-#{i}" do |node|
            node.ssh.insert_key = false
            node.vm.box = IMAGE_NAME
            node.vm.network  "private_network", ip: "#{IP_BASE}#{i+10}"
            node.vm.hostname = "#{VM_NAME}-#{i}.ych.com"
            node.vm.synced_folder  ".", "/vagrant", type: "rsync"

            node.vm.provider "virtualbox" do |v|
                v.name = "#{VM_NAME}-#{i}"
                v.memory = MASTERS_MEM
                v.cpus = MASTERS_CPU
            end
            node.vm.provision "ansible" do |ansible|
                ansible.playbook = "playbook/main.yml"
                ansible.extra_vars = {
                    node_ip:  "#{IP_BASE}#{i+10}"
                }
            end
        end
    end
end

