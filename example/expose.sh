#!/usr/bin/env bash

echo "Installation du support des ACL..."

#sudo aptitude install acl

echo "Modification du fstab..."

cat /etc/fstab
sed s/remount-ro/remount-ro,acl/ /etc/fstab > /tmp/truc 
cp /tmp/truc /etc/fstab

mount -n -o remount,acl /dev/sda1

echo "Trouver le ligne qui a changé"

grep acl --color=always /etc/fstab

echo "Creating file system..."

cd /tmp
mkdir expose
cd expose

echo "Creating a file..."

touch fichier
mkdir repertoire

echo "Show initial ACL"

getfacl fichier

echo "Faire la netoyage.."

rm -Rf /tmp/expose
sed s/remount-ro,acl/remount-ro/ /tmp/truc > /etc/fstab
rm /tmp/truc

#sudo aptitude remove acl
