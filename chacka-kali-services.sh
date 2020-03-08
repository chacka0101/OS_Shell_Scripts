#!/bin/bash

echo "
		 ██████╗██╗  ██╗ █████╗  ██████╗██╗  ██╗ █████╗
		██╔════╝██║  ██║██╔══██╗██╔════╝██║ ██╔╝██╔══██╗
		██║     ███████║███████║██║     █████╔╝ ███████║
		██║     ██╔══██║██╔══██║██║     ██╔═██╗ ██╔══██║
		╚██████╗██║  ██║██║  ██║╚██████╗██║  ██╗██║  ██║
		 ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝
		 Colombia Hack Agent (CHackA)

[...]	Developer:		Jairo A. García H.		[...]
[...]	Version:		1.0.				[...]
[...]	Codename:		'KALI Services'			[...]
[...]	Report bugs to:		chacka0101@gmail.com 		[...]
[...]	Homepage:		https://github.com/chacka0101/	[...]
"
PS3='# Enter option or pulse "Enter" to Menu: '
echo " "
echo "##############################################"
echo "#                  MENU                      #"
echo "##############################################"
echo " "
options=("Service Manager" "Status Service" "Start Service" "Restart Service" "Stop Service" "Service Boot Persistence" "Service Boot Persistence GUI - RCCONF" "Custom WEB" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Service Manager")
echo "##############################################"
            sudo ls -la /etc/init.d/ | more
            ;;
        "Status Service")
echo "##############################################"
            echo "Status Service:"
            echo "Example: sshd, apache2"
            read var_netstatservice
           sudo systemctl status $var_startservice
            ;;
        "Start Service")
echo "##############################################"
            echo "Start Service:"
            echo "Example: ssh, apache2."
            read var_startservice
            sudo systemctl start $var_startservice
            ;;
        "Restart Service")
echo "##############################################"
            echo "Restart Service:"
            echo "Example: ssh, apache2"
            read var_restartservice
            sudo systemctl restart $var_startservice
            ;;
        "Stop Service")
echo "##############################################"
            echo "Stop Service:"
            echo "Example: ssh, apache2"
            read var_stopservice
            sudo systemctl stop $var_startservice
            ;;
        "Service Boot Persistence")
echo "##############################################"
            echo "Enter the persistence service:"
            echo "Example: ssh, apache2"
            read var_persistenceservice
            sudo systemctl enable $var_startservice
            ;;
        "Service Boot Persistence GUI - RCCONF")
echo "##############################################"
            echo "RCCONF:"
	    echo "Install: kali@kali:/$ sudo apt-get install rcconf"
            sudo rcconf
            ;;
        "Custom WEB")
echo "##############################################"
            echo "Enter the Text for the Index:"
	    sudo systemctl start apache2
	    sudo cd /var/www/html/index.html
	    echo "Editamos el index.html"
	    sudo nano /var/www/html/index.html
            python -m webbrowser http://127.0.0.1/index.html
            ;;
        "Quit")
echo " "
echo "#################################################"
echo "#                     BYE                       #"
echo "# The Matrix has you, follow the white rabbit.| #"
echo "#################################################"
            break
            ;;
        *) echo invalid option;;
    esac
done
# END
exit
