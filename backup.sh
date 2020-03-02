#!/bin/sh

# verify the options
if [ $# -eq 0 ]
then
        echo "Missing options!"
        echo "(run $0 -h for help)"
        echo ""
        exit 0
fi


case "$1" in

	-s)sudo mkdir /backup
		sudo mkdir /backup/$USER
		echo "-s, coping data for backup" && sudo  cp -vr /home/$USER/Documents /backup/$USER;;

	-ar) echo "-ar, create tar file" && sudo tar -cf /backup/backup-$USER.tar /home/$USER/Documents && sudo rm -rf /backup/$USER;;

	-c) echo "-c, compress data" && sudo tar -czf /backup/backup-$USER.tar.xz /home/$USER/Documents && sudo rm -rf /backup/backup-$USER.tar;;

	-r) echo "-r restor data"&&mkdir backup && sudo tar -xzvf /backup/backup-$USER.tar.xz -C /home/$USER/backup  && sudo rm /backup/backup-$USER.tar.xz;;

	-h) echo "help option"
		echo "-s, coping data for backup \n-ar, create tar file \n-c, compress data \n-r, restor data \n"
		;;

	*) echo "Option $1 not recognized" ;;

esac

