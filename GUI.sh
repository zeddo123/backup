#! /bin/bash 
action=$(yad --width 300 --entry --title "System Logout" 
      --image=gnome-shutdown 
--center --on-top 
--button="gtk-ok:0" --button="gtk-close:1" 
--text "Choose action:" 
--entry-text 
"s" "ar" "c" "help" )  
ret=$? 


[[ $ret -eq 1 ]] && exit 0 






case $action in 
        s*) rsync -Rr /home/$user ./backup/$user ;; 
        ar*)  tar cf] backup.tar backup  
           rm -rf backup ;; 
        c*) xz -k9 backup.tar 
           rm -rf backup.tar ;; 
        help*) 
yad --form --width=500 --text="-s pour copier les donnes d'utullisateur dans un fichier backup 
 -ar pour archiver le fichier backup en extension .tar et supprimer le fichier backup 
-c pour archiver le fichier backup.tar en extension .tar.xz et supprimer l'extension precedente .tar 
-r pour decompresser le fichier backup.tar.xz"\ ;;



esac