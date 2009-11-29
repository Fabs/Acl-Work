#!/usr/bin/env bash

n=0

export COLOR_NC='\e[0m' # No Color
export COLOR_WHITE='\e[1;37m'
export COLOR_BLACK='\e[0;30m'
export COLOR_BLUE='\e[0;34m'
export COLOR_LIGHT_BLUE='\e[1;34m'
export COLOR_GREEN='\e[0;32m'
export COLOR_LIGHT_GREEN='\e[1;32m'
export COLOR_CYAN='\e[0;36m'
export COLOR_LIGHT_CYAN='\e[1;36m'
export COLOR_RED='\e[0;31m'
export COLOR_LIGHT_RED='\e[1;31m'
export COLOR_PURPLE='\e[0;35m'
export COLOR_LIGHT_PURPLE='\e[1;35m'
export COLOR_BROWN='\e[0;33m'
export COLOR_YELLOW='\e[1;33m'
export COLOR_GRAY='\e[1;30m'
export COLOR_LIGHT_GRAY='\e[0;37m'

example () {
	read a ; clear
	n=$((n + 1))
	echo "###########################################################"
	echo "Ex $n: $1"
	echo "###########################################################"
}

run () {
	echo "\e[0;31m $@ \e[0m"
	$@
}

example "Installation du support des ACL..."
run sudo aptitude install acl


example "Modification du fstab..."
run cat /etc/fstab
sed s/errors=remount-ro/acl,errors=remount-ro/ /etc/fstab > /tmp/truc 
run cp /tmp/truc /etc/fstab
run sudo mount -n -o remount,acl /dev/sda1


example "Trouver le ligne qui a changé"
grep acl --color=always /etc/fstab


example "Creating file system..."
cd /tmp
mkdir expose
cd expose


example "Creating a file..."
touch fichier


example "Show initial ACL"
ls -la
getfacl fichier


example "Création d'un répertoire avec umask"
# Modification du umask : 027 (qui est le complément de 750)
umask 027
mkdir repertoire
# Affichage des droits
ls -dl repertoire

example "Affichage des ACL"
getfacl repertoire

example "Ajout d'un utilisateur nommé et affichage des ACL"
sudo setfacl -m user:userir:rwx repertoire
getfacl --omit-header repertoire 

example "Permission ACL non effective"
chmod g-w repertoire 
ls -dl repertoire 
getfacl --omit-header repertoire 


example "Changement des droits pour que toutes les ACL soient effectives"
chmod g+w repertoire 
ls -dl repertoire

example "ACL par défaut"
#AVOIR couleurs
setfacl -d -m group:admin:rwx repertoire 
getfacl --omit-header repertoire 

example "Héritage des ACL par défaut"
mkdir repertoire/subrep 
getfacl --omit-header repertoire/subrep 

example "Faire la netoyage.."
rm -Rf /tmp/expose
sed s/acl,errors=remount-ro/errors=remount-ro/ /tmp/truc > /etc/fstab
rm /tmp/truc
#sudo aptitude remove acl

