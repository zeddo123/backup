#!/bin/bash

case "$1" in

	-s)sudo mkdir /backup
		sudo mkdir /backup/$USER
		echo "-s, coping data for backup" && sudo  cp -vr /home/$USER/Documents /backup/$USER;;

	-ar) echo "-ar, create tar file" && sudo tar -cf /backup/backup-$USER.tar /home/$USER/Documents && sudo rm -rf /backup/$USER;;

	-c) echo "-c, compress data" && sudo tar -czf /backup/backup-$USER.tar.xz /home/$USER/Documents && sudo rm -rf /backup/backup-$USER.tar;;

	-r) echo "-r restore data"&& mkdir /home/$USER/backup && sudo tar -xzvf /backup/backup-$USER.tar.xz -C /home/$USER/backup  && sudo rm /backup/backup-$USER.tar.xz;;

	-h) echo "help option"
			echo "-s, coping data for backup"
			echo "-ar, create tar file"
			echo "-c, compress data"
			echo "-r, restor data"
			echo "-gui, starts the graphical version"
		;;

	-gui)
		yad --text="Press the desired action to perform:" --image=gnome-reboot --title="BackUp Utility" --centre --on-top\
			--button="Cancel":1 \
			--button="Copy":2 \
			--button="Create a Tar archive":3 \
			--button="compress the Tar File":4 \
			--button="restore data":5

		foo=$?
		echo $foo
		[[ $foo -eq 1 ]] && exit 0

		if [[ $foo -eq 2 ]]; then
			./backup.sh -s

		elif [[ $foo -eq 3 ]]; then
			./backup.sh -ar

		elif [[ $foo -eq 4 ]]; then
			./backup.sh -c

		else
			./backup.sh -r
		fi
	;;
	*) echo "Option $1 not recognized" ;;

esac

