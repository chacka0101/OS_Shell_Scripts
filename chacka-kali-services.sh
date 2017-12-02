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
options=("Service Manager" "Netstat Service" "Start Service" "Restart Service" "Stop Service" "Service Boot Persistence" "Service Boot Persistence GUI - RCCONF" "Custom WEB" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Service Manager")
echo "##############################################"
            ls -la /etc/init.d/ | more
            ;;
        "Netstat Service")
echo "##############################################"
            echo "Nestat Service:"
            echo "Example: sshd, apache2"
            read var_netstatservice
            netstat -antp | grep $var_netstatservice
            ;;
        "Start Service")
echo "##############################################"
            echo "Start Service:"
            echo "Example: ssh, apache2."
            read var_startservice
            service $var_startservice start
            ;;
        "Restart Service")
echo "##############################################"
            echo "Restart Service:"
            echo "Example: ssh, apache2"
            read var_restartservice
            /etc/init.d/$var_restartservice restart
            ;;
        "Stop Service")
echo "##############################################"
            echo "Stop Service:"
            echo "Example: ssh, apache2"
            read var_stopservice
            service $var_stopservice stop
            ;;
        "Service Boot Persistence")
echo "##############################################"
            echo "Enter the persistence service:"
            echo "Example: ssh, apache2"
            read var_persistenceservice
            update-rc.d $var_persistenceservice enable
            ;;
        "Service Boot Persistence GUI - RCCONF")
echo "##############################################"
            echo "RCCONF:"
            rcconf
            ;;
        "Custom WEB")
echo "##############################################"
            echo "Enter the Text for the Index:"
            read var_httpbanner
            echo "$var_httpbanner" > /var/www/html/index.html
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
