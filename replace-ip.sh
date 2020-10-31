ip=$(redis-cli hmget vm_ips redis)
sed "s/IP_OF_REDIS/$ip/" Vagrantfile.template > Vagrantfile
