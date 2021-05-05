#!/bin/bash
echo "
                      CHackA0101
[...]   Developers:             CHackA0101 and DesertH4wk       [...]
[...]   Version:                2.0.                            [...]
[...]   Codename:               'kali-recon-script-v2.sh'       [...]
[...]   Report bugs to:         chacka0101 @ gmail.com          [...]
[...]   Homepage:               https://github.com/chacka0101/  [...]
"
PS3='└─# Press "Enter" or press (4) to exit: '
echo " "
echo "##############################################"
echo "#                  MENU 💀                   #"
echo "##############################################"
echo " "
options=("Install requirements" "Recon OS - Test ICMP - TraceRoute - Scan Ports NO ICMP - Commons UDP - ALL Ports TCP" "Recon WEB - Headers - WEB Tech WAD - WEB Tech WhatWeb - WEB Directories with GoBuster" "Exit")
select opt in "${options[@]}"
do
    case $opt in
        "Install requirements")
echo "##############################################"
            cd /home/chacka0101/
            echo "# Create directory: /home/chacka0101/tools"
            echo "# Create directory: /home/chacka0101/targets"
            echo "# Create directory: /home/chacka0101/targets/recon"
            echo "# Create directory: /home/chacka0101/targets/recon/web"
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
            sudo apt-get install xsltproc
            echo "# OK."
            echo "# Install PIP:" 
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
            echo "# Download WhatWeb:"
            sudo git clone https://github.com/urbanadventurer/WhatWeb.git
            echo "# OK."
            echo "# Install GoBuster:"
            echo "deb-src http://http.kali.org/kali kali-rolling main non-free contrib" >> /etc/apt/sources.list
            sudo apt update
            sudo apt-get install gobuster
            echo "# OK."
            echo "  "
            echo "# END."
            ;;
        "Recon OS - Test ICMP - TraceRoute - Scan Ports NO ICMP - Commons UDP - ALL Ports TCP")
echo "##############################################"
            echo "# Recon"
            echo "# ---------------------------------------------------------"
            cd /home/chacka0101/targets/recon/
            echo "┌──(root💀kali)-[/]"
            echo "└─# Type target recon IP:"
            read var_ip
            sudo mkdir /home/chacka0101/targets/recon/$var_ip
            base_directory=/home/chacka0101/targets/recon/$var_ip
            echo "# Create $var_ip on /home/chacka0101/targets/recon/$var_ip"
            echo "  "
            echo "# OK."
            echo "  "
            echo "# Recon OS:"
            echo "  "
            sudo python /home/chacka0101/tools/recon_os.py $var_ip > /home/chacka0101/targets/recon/$var_ip/recon_os.txt
            echo "┌──(root💀kali)-[/]"
            echo "└─# Recon OS:"
            cat /home/chacka0101/targets/recon/$var_ip/recon_os.txt     
            echo "  " 
            echo "# Test ICMP:"
            echo "  "
            sudo hping3 -1 -c 3 $var_ip > /home/chacka0101/targets/recon/$var_ip/hping3_icmp.txt
            echo "┌──(root💀kali)-[/]"
            echo "└─# Result Test ICMP:"
            cat /home/chacka0101/targets/recon/$var_ip/hping3_icmp.txt            
            echo "  " 
            echo "# Test TraceRoute:"
            echo "  "
            sudo ping -R -c 1 $var_ip > /home/chacka0101/targets/recon/$var_ip/traceroute.txt
            echo "┌──(root💀kali)-[/]"
            echo "└─# Result Test TraceRoute:"
            cat /home/chacka0101/targets/recon/$var_ip/traceroute.txt    
            echo "  " 
            echo "# Scan Ports NO ICMP:"
            sudo nmap -Pn -sV -oG $base_directory/tmp_ports_noICMP.txt -vv $var_ip > /home/chacka0101/targets/recon/$var_ip/ports_noicmp.txt
            echo "┌──(root💀kali)-[/]"
            echo "└─# ResultScan Ports NO ICMP:"
            cat /home/chacka0101/targets/recon/$var_ip/ports_noicmp.txt
            echo "  " 
            echo "# Scan commons Ports UDP:"
            echo "  "
            sudo nmap -sU -p- --min-rate 10000 -oG $base_directory/tmp_ports_udp.txt -vv $var_ip > /home/chacka0101/targets/recon/$var_ip/ports_udp.txt
            echo "┌──(root💀kali)-[/]"
            echo "└─# Result Scan Scan commons Ports UDP:"
            cat /home/chacka0101/targets/recon/$var_ip/ports_udp.txt 
            echo "  " 
            echo "# Scan ALL ports TCP:"
            sudo masscan -e tun0 --open -p1-65535 --max-rate 1000 $var_ip > /home/chacka0101/targets/recon/$var_ip/ports_all.txt
            echo "┌──(root💀kali)-[/]"
            echo "└─# Result Scan ALL ports TCP:"
            cat /home/chacka0101/targets/recon/$var_ip/ports_all.txt 
            echo "  " 
            cat /home/chacka0101/targets/recon/$var_ip/ports_all.txt | grep open | cut -d ' ' -f 4 | cut -d '/' -f 1 > $base_directory/tmp_port_list.txt
            cat $base_directory/tmp_ports_noICMP.txt | grep -oP '\d{1,5}/open' | cut -d '/' -f 1 >> $base_directory/tmp_port_list.txt
            cat $base_directory/tmp_ports_udp.txt | grep -oP '\d{1,5}/open' | cut -d '/' -f 1 >> $base_directory/tmp_port_list.txt
            open_ports=$(sort -n $base_directory/tmp_port_list.txt  | uniq | xargs | tr ' ' ',')
            rm $base_directory/tmp_ports_noICMP.txt $base_directory/tmp_ports_udp.txt $base_directory/tmp_port_list.txt
            echo "┌──(root💀kali)-[/]"
            echo "└─# List specific ports:"
			echo "  " 
            echo $open_ports
			echo "  "
            echo "# Scan specific ports:"
			echo "  "
            sudo nmap -sV -sC -A -p $open_ports -vv $var_ip > /home/chacka0101/targets/recon/$var_ip/specific_scan_ports.txt
            echo "┌──(root💀kali)-[/]"
            echo "└─# Result Scan CUSTOM ports:"
            cat /home/chacka0101/targets/recon/$var_ip/specific_scan_ports.txt
			echo "  "
            echo "# Scan specific ports with nmap-bootstrap:"
			echo "  "
			sudo nmap -T4 -sC -sV -v -p $open_ports -oA $base_directory/specific_scan_ports_html --script vuln --stylesheet nmap-bootstrap.xsl $var_ip
			sudo xsltproc -o /home/chacka0101/targets/recon/$var_ip/specific_scan_ports_html.html /home/chacka0101/tools/nmap-bootstrap-xsl /home/chacka0101/targets/recon/$var_ip/specific_scan_ports_html.xml
            echo "┌──(root💀kali)-[/]"
            echo "└─# Result Scan specific ports with nmap-bootstrap:"
            echo "  "
			echo " Output nmap-bootstrap result: cd /home/chacka0101/targets/recon/$var_ip/specific_scan_ports_html.html" 
			echo "  "
			echo "# ---------------------------------------------------------"
			echo "  " 
            echo " ----- All Output results: cd /home/chacka0101/targets/recon/$var_ip/  -----"
            echo "  "
			echo "# ---------------------------------------------------------"
            echo "# END."
            echo "  "
            echo "  "
            ;;
        "Recon WEB - Headers - WEB Tech WAD - WEB Tech WhatWeb - WEB Directories with GoBuster")
echo "##############################################"
            echo "# Recon WEB"
            echo "# ----------------------------"
            echo "┌──(root💀kali)-[/]"
            echo "└─# Type WEB IP: "
            read var_ip
            echo "└─# Type WEB protocol (http or https): "
            read var_protocol
            sudo mkdir /home/chacka0101/targets/recon/$var_ip/
            sudo mkdir /home/chacka0101/targets/recon/$var_ip/web
            echo "  " 
            echo "# Scan WEB Headers"
            sudo finalrecon --headers $var_protocol://$var_ip/ > /home/chacka0101/targets/recon/$var_ip/web/scan_headers.txt
            echo "┌──(root💀kali)-[/]"
            echo "└─# Result Scan WEB Headers:"
            cat /home/chacka0101/targets/recon/$var_ip/web/scan_headers.txt  
            echo "  "
            echo "# Scan WEB Tech WAD"
            sudo wad -u $var_protocol://$var_ip/ > /home/chacka0101/targets/recon/$var_ip/web/scan_web_tech_wad.txt
            echo "# Scan WEB Tech WhatWEB"
            sudo /home/chacka0101/tools/WhatWeb/whatweb $var_protocol://$var_ip/ > /home/chacka0101/targets/recon/$var_ip/web/scan_web_tech_whatweb.txt
            echo "  "
            echo "┌──(root💀kali)-[/]"
            echo "└─# Result Scan WEB Tech WAD:"
            cat /home/chacka0101/targets/recon/$var_ip/web/scan_web_tech_wad.txt
            echo "└─# Result Scan WEB Tech WhatWeb:"
            cat /home/chacka0101/targets/recon/$var_ip/web/scan_web_tech_whatweb.txt    
            echo "  " 
            echo "# Scan WEB Directories with GoBuster"
            if [ $var_protocol == "https" ]; then    
                sudo gobuster dir -e -k -u $var_protocol://$var_ip/ -w /usr/share/wordlists/dirb/common.txt -t 50 > /home/chacka0101/targets/recon/$var_ip/web/https_web_common.txt
                echo "# 100% Complete HTTPS Common (https_web_common.txt)";
             else
                sudo gobuster dir -e -u $var_protocol://$var_ip/ -w /usr/share/wordlists/dirb/common.txt -t 50 > /home/chacka0101/targets/recon/$var_ip/web/http_web_common.txt
                echo "# 100% Complete HTTP Common (https_web_common.txt)"
            fi
            echo "  "
            echo " Output: cd /home/chacka0101/targets/recon/$var_ip/web/"
            echo "  "
            echo "# END."
            ;;
        "Exit")
echo " "
echo " "
echo "#################################################"
echo "#                     BYE 💀                    #"
echo "# The Matrix has you, follow the white rabbit.| #"
echo "#################################################"
            break
            ;;
        *) echo invalid option;;
    esac
done
# END
exit
