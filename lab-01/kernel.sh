#!/bin/bash

yum update -y
yum install wget nano binutils gcc make patch kernel-headers bison flex  -y
cd /usr/src
wget https://cdn.kernel.org/pub/linux/kernel/v4.x/linux-4.20.6.tar.xz
tar -xvf linux-4.20.6.tar.xz
ln -s linux-4.20.6 linux
cp /boot/config-3.10.0-957.1.3.el7.x86_64 /usr/src/linux/.config
yum install openssl-devel perl bc elfutils-libelf-devel -y
cd /usr/src/linux
make olddefconfig
make && make modules
make modules_install && make install
grub2-mkconfig /boot/grub2/grub.cfg
grub2-set-default 0


