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
[...]	Version:		1.1.				[...]
[...]	Codename:		'KALI locate, which, find'	[...]
[...]	Report bugs to:		chacka0101@gmail.com 		[...]
[...]	Homepage:		https://github.com/chacka0101/	[...]
"
PS3='# Enter option or pulse "Enter" to Menu: '
echo " "
echo "##############################################"
echo "#                  MENU                      #"
echo "##############################################"
echo " "
options=("Search LOCATE" "Search WHICH" "Search FIND" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Search LOCATE")
echo "##############################################"
            echo "Search with LOCATE:"
            read var_locate
            locate $var_locate | more
            ;;
        "Search WHICH")
echo "##############################################"
            echo "Search with WHICH:"
            read var_which
            which $var_which | more
            ;;
        "Search FIND")
echo "##############################################"
            echo "Search with FIND:"
            read var_find
            find / -name $var_find* -exec file {} \; | more
            find / -name $var_find* | more
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
