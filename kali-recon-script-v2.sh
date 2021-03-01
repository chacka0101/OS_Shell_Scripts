#!/bin/bash
echo "
                      CHackA0101
[...]   Developer:              Jairo Garcia		        [...]
[...]   Version:                2.0.                            [...]
[...]   Codename:               'kali-recon-script-v2.sh'       [...]
[...]   Report bugs to:         chacka0101 @ gmail.com          [...]
[...]   Homepage:               https://github.com/chacka0101/  [...]
"
PS3='└─# Press "Enter" or press (3) to exit: '
echo " "
echo "##############################################"
echo "#                  MENU                      #"
echo "##############################################"
echo " "
options=("Requirements" "Recon OS - Test ICMP - TraceRoute - Scan Ports NO ICMP - Commons UDP - ALL Ports TCP" "Exit")
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
            echo "# END."
            ;;
        "Recon OS - Test ICMP - TraceRoute - Scan Ports NO ICMP - Commons UDP - ALL Ports TCP")
echo "##############################################"
            echo "# Recon"
            echo "# ----------------------------"
            cd /home/chacka0101/targets/recon/
            echo "┌──(root💀kali)-[/]"
            echo "└─# Type target recon IP:"
            read var_ip
            sudo mkdir /home/chacka0101/targets/recon/$var_ip
            echo "# Create $var_ip on /home/chacka0101/targets/recon/$var_ip"
            echo "  "
            echo "# OK."
            echo "  "
            echo "# Recon OS:"
            sudo python /home/chacka0101/tools/recon_os.py $var_ip > /home/chacka0101/targets/recon/$var_ip/recon_os.txt
            echo "┌──(root💀kali)-[/]"
            echo "└─# Recon OS:"
            cat /home/chacka0101/targets/recon/$var_ip/recon_os.txt     
            echo "  " 
            echo "# Test ICMP:"
            sudo hping3 -1 -c 3 $var_ip > /home/chacka0101/targets/recon/$var_ip/hping3_ICMP.txt
            echo "┌──(root💀kali)-[/]"
            echo "└─# Result Test ICMP:"
            cat /home/chacka0101/targets/recon/$var_ip/hping3_ICMP.txt            
            echo "  " 
            echo "# Test TraceRoute:"
            sudo ping -R -c 1 $var_ip > /home/chacka0101/targets/recon/$var_ip/traceroute.txt
            echo "┌──(root💀kali)-[/]"
            echo "└─# Result Test TraceRoute:"
            cat /home/chacka0101/targets/recon/$var_ip/traceroute.txt    
            echo "  " 
            echo "# Scan Ports NO ICMP:"
            sudo nmap -Pn -sV -vv $var_ip > /home/chacka0101/targets/recon/$var_ip/ports_NoICMP.txt
            echo "┌──(root💀kali)-[/]"
            echo "└─# ResultScan Ports NO ICMP:"
            cat /home/chacka0101/targets/recon/$var_ip/ports_NoICMP.txt  
            echo "  " 
            echo "# Scan coomons Ports UDP:"
            sudo nmap -sU -p- --min-rate 10000 -vv $var_ip > /home/chacka0101/targets/recon/$var_ip/ports_UDP.txt
            echo "┌──(root💀kali)-[/]"
            echo "└─# Result Scan Scan coomons Ports UDP:"
            cat /home/chacka0101/targets/recon/$var_ip/ports_UDP.txt  
            echo "  " 
            echo "# Scan ALL ports TCP:"
            sudo masscan -e tun0 --open -p1-65535 --max-rate 1000 $var_ip > /home/chacka0101/targets/recon/$var_ip/ports_ALL.txt
            echo "┌──(root💀kali)-[/]"
            echo "└─# Result Scan ALL ports TCP:"
            cat /home/chacka0101/targets/recon/$var_ip/ports_ALL.txt  
            echo "  " 
            echo " Output: /home/chacka0101/targets/recon/$var_ip/"
            echo "  "
            echo "# END."
            ;;
        "Exit")
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
