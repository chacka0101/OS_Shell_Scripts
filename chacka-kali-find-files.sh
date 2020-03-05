#!/bin/bash

echo "
                 ██████╗██╗  ██╗ █████╗  ██████╗██╗  ██╗ █████╗
                ██╔════╝██║  ██║██╔══██╗██╔════╝██║ ██╔╝██╔══██╗
                ██║     ███████║███████║██║     █████╔╝ ███████║
                ██║     ██╔══██║██╔══██║██║     ██╔═██╗ ██╔══██║
                ╚██████╗██║  ██║██║  ██║╚██████╗██║  ██╗██║  ██║
                 ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝
                 Colombia Hack Agent (CHackA)
[...]   Developer:              Jairo A. García H.              [...]
[...]   Version:                1.2.                            [...]
[...]   Codename:               'Search in Kali Linux'      	[...]
[...]   Report bugs to:         chacka0101@gmail.com            [...]
[...]   Homepage:               https://github.com/chacka0101/  [...]
"
PS3='# Enter option or pulse "Enter" to Menu or other options: '
echo " "
echo "##############################################"
echo "#                  MENU                      #"
echo "##############################################"
echo " "
options=("Search in Kali Linux" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Search in Kali Linux")
echo "##############################################"
            echo "Search in Kali Linux"
            read var_locate
            echo "Search with LOCATE:"
            locate $var_locate | more
            echo "Search with WHICH:"
            which $var_locate | more
            echo "Search with FIND:"
            find / -name $var_locate* -exec file {} \; | more
            find / -name $var_locate* | more
            ;;
        "Quit")
echo " "
echo " "
echo " ---------  OTHER OPTIONS TO SEARCH ----------------"
echo "Search with meterpreter: kali@kali:~$ search -f *.txt "
echo " "
echo "Search Windows: "
echo "Change directory: C:\cd /D D:\ "
echo "Option 1: C:\>dir /b/s proof"
echo "Option 2: C:\>find /I "proof" C:\* "
echo " "
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
