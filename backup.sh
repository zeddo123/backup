#!/bin/sh

case "$1" in

	-s)sudo mkdir /backup
		sudo mkdir /backup/$USER
		echo "-s, coping data for backup" && sudo  cp -vr /home/$USER/Documents /backup/$USER;;

	-ar) echo "-ar, create tar file" && sudo tar -cf /backup/backup-$USER.tar /home/$USER/Documents && sudo rm -rf /backup/$USER;;

	-c) echo "-c, compress data" && sudo tar -czf /backup/backup-$USER.tar.xz /home/$USER/Documents && sudo rm -rf /backup/backup-$USER.tar;;

	-r) echo "-r restor data"&& mkdir /home/$USER/backup && sudo tar -xzvf /backup/backup-$USER.tar.xz -C /home/$USER/backup  && sudo rm /backup/backup-$USER.tar.xz;;

	-h) echo "help option"
			echo "-s, coping data for backup"
			echo "-ar, create tar file"
			echo "-c, compress data"
			echo "-r, restor data"
		;;

	*) echo "Option $1 not recognized" ;;

esac

