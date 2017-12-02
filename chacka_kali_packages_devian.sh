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
[...]	Codename:		'KALI Packages Devian'			[...]
[...]	Report bugs to:		chacka0101@gmail.com 		[...]
[...]	Homepage:		https://github.com/chacka0101/	[...]
"
PS3='# Enter option or pulse "Enter" to Menu: '
echo " "
echo "##############################################"
echo "#                  MENU                      #"
echo "##############################################"
echo " "
options=("Search Packages" "Install Sublime Text 3" "Install RCCONF" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Search Packages")
echo "##############################################"
            python -m webbrowser https://www.debian.org/distrib/packages#search_packages
            ;;
        "Install Sublime Text 3")
echo "##############################################"
            wget http://c758482.r82.cf2.rackcdn.com/sublime-text_build-3083_amd64.deb
            sudo dpkg -i sublime-text_build-3083_amd64.deb
            cd /opt/sublime_text/
            ./sublime_text
            ;;
        "Install RCCONF")
echo "##############################################"
            wget https://github.com/chacka0101/chacka0101/blob/master/rcconf_3.2_all.deb
            sudo dpkg -i rcconf_3.2_all.deb
            rcconf
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
