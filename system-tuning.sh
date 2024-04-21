#!/bin/bash

# This script configures system parameters for Solana Validator
vi /etc/security/limits.d/

* soft nofile 100000
* hard nofile 100000

# making sure that nofile is set to 100000
echo 'ulimit -Sn 100000' >> ~/.bashrc
echo 'ulimit -Hn 100000' >> ~/.bashrc

source ~/.bashrc



# Configuring system parameters
sudo bash -c 'cat > /etc/sysctl.d/21-solana-validator.conf <<EOF
# Increase UDP buffer sizes
net.core.rmem_default = 134217728
net.core.rmem_max = 134217728
net.core.wmem_default = 134217728
net.core.wmem_max = 134217728

# Increase memory mapped files limit
vm.max_map_count = 1000000

# Increase number of allowed open file descriptors
fs.nr_open = 1000000
EOF'

# Applying the sysctl changes
sudo sysctl -p /etc/sysctl.d/21-solana-validator.conf


# Creating a file to set process file descriptor count limit
sudo bash -c 'cat >/etc/security/limits.d/90-solana-nofiles.conf <<EOF
# Increase process file descriptor count limit
* - nofile 1000000
EOF'

sudo ufw allow "OpenSSH" \
sudo ufw allow 8000:8020/udp \
sudo ufw allow 8000/tcp \
sudo ufw allow 8001/tcp \
sudo ufw allow 8899/tcp \ ## only if serving RPC requests. ideally reverse proxy them through an authenticated web server.
sudo ufw allow 8900/tcp \
sudo ufw enable \
sudo ufw status 


lsblk
# Partition for ledger
sudo parted /dev/vdb mklabel gpt
sudo parted /dev/vdb mkpart primary ext4 0% 40%
sudo mkfs.ext4 /dev/vdb1
sudo mkdir /mnt/ledger
sudo mount /dev/vdb1 /mnt/ledger
sudo blkid /dev/vdb1
echo 'UUID=<my-uuid> /mnt/ledger ext4 defaults 0 2' | sudo tee -a /etc/fstab

# Partition for accounts
sudo parted /dev/vdb mkpart primary ext4 40% 85%
sudo mkfs.ext4 /dev/vdb2
sudo mkdir /mnt/accounts
sudo mount /dev/vdb2 /mnt/accounts 
sudo blkid /dev/vdb2
echo 'UUID=fc6fea33-e7de-42be-857e-408d1724f982 /mnt/accounts ext4 defaults 0 2' | sudo tee -a /etc/fstab

# Partition for ramdisk swap memory
sudo mkdir /mnt/accounts/ramdisk
echo 'tmpfs /mnt/accounts/ramdisk tmpfs rw,noexec,nodev,nosuid,noatime,size=300G 0 0' | sudo tee -a /etc/fstab
sudo swapoff /swapfile
sudo rm /swapfile
sudo sed --in-place '/swap/d' /etc/fstab

sudo parted /dev/vdb mkpart primary ext4 85% 100%    
sudo mkfs.ext4 /dev/vdb3
sudo mkdir /mnt/swap
sudo mount /dev/vdb3 /mnt/swap   
sudo blkid /dev/vdb3
echo 'UUID=f9d4b752-be0c-4266-9e2f-e3d64a4dd088 /mnt/swap ext4 defaults 0 2' | sudo tee -a /etc/fstab

sudo fallocate -l 250G /mnt/swap/swapfile
sudo chmod 600 /mnt/swap/swapfile
sudo mkswap /mnt/swap/swapfile
sudo swapon /mnt/swap/swapfile
echo 'UUID=bb064670-9a56-4b53-a443-f82a2ee7d82b /mnt/swap/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab














