 
#! /bin/bash
if [ $# -eq 0 ]
then
	while :
	do
		echo "*****************************************************************"
		echo "______________________________MENU_______________________________"
		echo "Enter 0 to exit"
		echo "1. Copy $USER's data -s"
		echo "2. Archive the data (option -ar)"
		echo "3. Compress the data to a /backup/$USER.tar.xy file (option -c)"
		echo "4. Restore the data in $HOME (option -r), subsequently the archive will be deleted."
		echo "*****************************************************************"
		echo ">>"
		read choix
		case $choix in 

			*1) 
				echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
				./backup.sh -s
				echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
			;;
			*2) 
	 			echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
				./backup.sh -ar
				echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
			;;
			*3) 
				echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	  			./backup.sh -c
				echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
			;;
			*4)
				echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
				./backup.sh -r
				echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
			;;
			0)
				echo "Any time ,$USER"
				echo "Change the world, my final message, Goodbye"
				exit 0
	  		;;
		esac
	done
else
	case "$1" in

	-s)./backup.sh -s;;

	-ar)./backup.sh -ar;;

	-c)./backup.sh -c;;

	-r) ./backup.sh -r;;

	-h) ./backup.sh -h;;

	*) echo "Option $1 not recognized" ;;

esac
fi

