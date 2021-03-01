#!/bin/bash
echo "
               Colombia Hacking Agent (CHackA0101)
[...]   Developer:              Jairo Garcia		        [...]
[...]   Version:                2.0.                            [...]
[...]   Codename:               'kali-recon-script-v2.sh'       [...]
[...]   Report bugs to:         chacka0101 @ gmail.com          [...]
[...]   Homepage:               https://github.com/chacka0101/  [...]
"
PS3='# Enter option or pulse "Enter" to Menu or other options: '
echo " "
echo "##############################################"
echo "#                  MENU                      #"
echo "##############################################"
echo " "
options=("Requirements" "Recon OS" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Requirements")
echo "##############################################"
            cd /home/chacka0101/
            echo "# Create directory: /home/chacka0101/tools"
            echo "# Create directory: /home/chacka0101/targets"
            echo "# Create directory: /home/chacka0101/targets/recon"
            sudo mkdir {tools,targets}
            cd /home/chacka0101/targets/
            sudo mkdir recon
            echo "# OK."
            echo "# Downloads and install tools:"
            cd /home/chacka0101/tools/
            echo "# ----------------------------"
            echo "# Download nmap-bootstrap.xsl:"         
            sudo wget https://raw.githubusercontent.com/chacka0101/exploits/master/nmap-bootstrap-xsl
            sudo chmod +x /home/chacka0101/tools/nmap-bootstrap-xsl
            echo "# OK."
            echo "# Install WAD - Web application detector:" 
            sudo apt-get install pip
            echo "# OK."
            echo "# Install WAD - Web application detector:" 
            sudo pip install wad
            echo "# OK."
            echo "# Install telnet:" 
            sudo apt install telnet
            echo "# OK."
            echo "# Install rockyou wordlist:" 
            cd /usr/share/wordlists/                                                                                                     
            sudo gzip -d rockyou.txt.gz
            cd /home/chacka0101/tools
            echo "# OK."
            echo "# Install finalrecon:" 
            sudo apt install finalrecon
            echo "# OK."
            echo "# Download recon_os.py:" 
            sudo wget https://raw.githubusercontent.com/chacka0101/exploits/master/recon_os.py
            sudo chmod +x /home/chacka0101/tools/recon_os.py
            echo "# OK."
            ;;
        "Recon OS")
echo "##############################################"
            echo "# Recon OS"
            echo "# ----------------------------"
            cd /home/chacka0101/recon/
            echo "# Target IP:"
            read var_ip
            sudo mkdir /home/chacka0101/targets/recon/$var_ip
            echo "# Create $var_ip on /home/chacka0101/targets/recon/$var_ip"
            echo "# OK."
            echo "# Recon recon_os.py:"
            sudo python /home/chacka0101/tools/recon_os.py $var_ip > /home/chacka0101/targets/recon/$var_ip/recon_OS.txt
            echo "# OK."          
            echo " Output: cat /home/chacka0101/targets/recon/$var_ip/recon_OS.txt"
            echo "# OK."
            ;;
        "Quit")
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
