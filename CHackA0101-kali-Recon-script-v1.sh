#!/bin/bash
echo "
 ██████╗██╗  ██╗ █████╗  ██████╗██╗  ██╗ █████╗  ██████╗  ██╗ ██████╗  ██╗
██╔════╝██║  ██║██╔══██╗██╔════╝██║ ██╔╝██╔══██╗██╔═████╗███║██╔═████╗███║
██║     ███████║███████║██║     █████╔╝ ███████║██║██╔██║╚██║██║██╔██║╚██║
██║     ██╔══██║██╔══██║██║     ██╔═██╗ ██╔══██║████╔╝██║ ██║████╔╝██║ ██║
╚██████╗██║  ██║██║  ██║╚██████╗██║  ██╗██║  ██║╚██████╔╝ ██║╚██████╔╝ ██║
 ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝  ╚═╝ ╚═════╝  ╚═╝	
               Colombia Hack Agent (CHackA0101)
[...]   Developer:              Alonso Garcia		        [...]
[...]   Version:                1.0.                            [...]
[...]   Codename:               'RECON'			      	[...]
[...]   Report bugs to:         chacka0101 @ gmail.com          [...]
[...]   Homepage:               https://github.com/chacka0101/  [...]
"
PS3='# Enter option or pulse "Enter" to Menu or other options: '
echo " "
echo "##############################################"
echo "#                  MENU                      #"
echo "##############################################"
echo " "
options=("Requirements" "Recon nmap DNS" "Recon nmap default scan icmp" "Recon nmap default scan no icmp" "Recon nmap scan all ports" "Recon WEB TECH with WAD - Web Application Detector" "Recon WEB directories and files HTTP and HTTPS" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Requirements")
echo "##############################################"
            echo "# Create directories: /chacka0101/Requirements/"
            mkdir /root/Downloads/chacka0101/            
	    mkdir /root/Downloads/chacka0101/Requirements/   
            echo "# OK."            
            echo "# Download nmap-bootstrap.xsl:"         
            sudo wget https://raw.githubusercontent.com/honze-net/nmap-bootstrap-xsl/master/nmap-bootstrap.xsl -O /root/Downloads/chacka0101/Requirements/nmap-bootstrap.xsl
            echo "# OK."            
            echo "# Install WAD - Web application detector:" 
            sudo pip install wad
            echo "# OK."
            ;;
        "Recon nmap DNS")
echo "##############################################"
            echo "# Recon nmap DNS"
            echo "# Box Name:"
            read var_box_name
            sudo mkdir /root/Downloads/chacka0101/$var_box_name 
            echo "# Create $var_box_name on /root/Downloads/chacka0101/$var_box_name"
            echo "# OK."
            echo "# RHOST IP:"
            read var_ip_dns
            echo "# RHOST IP is: $var_ip_dns"
            echo "# OK."
            echo "# Recon nmap DNS scan:"
            sudo nmap -T4 -sC -v -oA /root/Downloads/chacka0101/$var_box_name/$var_ip_dns-report-dns --script vuln --stylesheet /root/Downloads/chacka0101/Requirements/nmap-bootstrap.xsl $var_ip_dns
            xsltproc -o /root/Downloads/chacka0101/$var_box_name/$var_ip_dns-report-dns.html /root/Downloads/chacka0101/Requirements/nmap-bootstrap.xsl /root/Downloads/chacka0101/$var_box_name/$var_ip_dns-report-dns.xml
            sudo xdg-open /root/Downloads/chacka0101/$var_box_name/$var_ip_dns-report-dns.html
            echo "# OK."          
            echo " Report: /root/Downloads/chacka0101/$var_box_name/$var_ip_dns-report-dns.html"
            echo "# OK."
            ;;
        "Recon nmap default scan icmp")
echo "##############################################"
            echo "# Recon nmap default scan icmp"
            echo "# Box Name:"
            read var_box_name
            sudo mkdir /root/Downloads/chacka0101/$var_box_name 
            echo "# Create $var_box_name on /root/Downloads/chacka0101/$var_box_name"
            echo "# OK."
            echo "# RHOST IP:"
            read var_ip_icmp
            echo "# RHOST IP is: $var_ip_icmp"
            echo "# OK."
            echo "# Recon nmap default scan icmp:"
            sudo nmap -T4 -sC -sV -v -oA /root/Downloads/chacka0101/$var_box_name/$var_ip_icmp-report-icmp --script vuln --stylesheet /root/Downloads/chacka0101/Requirements/nmap-bootstrap.xsl $var_ip_icmp
            xsltproc -o /root/Downloads/chacka0101/$var_box_name/$var_ip_icmp-report-icmp.html /root/Downloads/chacka0101/Requirements/nmap-bootstrap.xsl /root/Downloads/chacka0101/$var_box_name/$var_ip_icmp-report-icmp.xml
            sudo xdg-open /root/Downloads/chacka0101/$var_box_name/$var_ip_icmp-report-icmp.html
            echo "# OK."          
            echo " Report: /root/Downloads/chacka0101/$var_box_name/$var_ip_icmp-report-icmp.html"
            echo "# OK."
            ;;
        "Recon nmap default scan no icmp")
echo "##############################################"
            echo "# Recon nmap default scan no icmp"
            echo "# Box Name:"
            read var_box_name
            sudo mkdir /root/Downloads/chacka0101/$var_box_name
            echo "# Create $var_box_name on /root/Downloads/chacka0101/$var_box_name"
            echo "# OK."
            echo "# RHOST IP:"
            read var_ip_noicmp
            echo "# RHOST IP is: $var_ip_noicmp"
            echo "# OK."
            echo "# Recon nmap default scan no icmp:"
            sudo nmap -T4 -Pn -sV -v -oA /root/Downloads/chacka0101/$var_box_name/$var_ip_noicmp-report-noicmp --script vuln --stylesheet /root/Downloads/nmap-bootstrap.xsl $var_ip_noicmp
            xsltproc -o /root/Downloads/chacka0101/$var_box_name/$var_ip_noicmp-report-noicmp.html /root/Downloads/chacka0101/Requirements/nmap-bootstrap.xsl /root/Downloads/chacka0101/$var_box_name/$var_ip_noicmp-report-noicmp.xml
            sudo xdg-open /root/Downloads/chacka0101/$var_box_name/$var_ip_noicmp-report-noicmp.html
            echo "# OK."          
            echo " Report: /root/Downloads/chacka0101/$var_box_name/$var_ip_noicmp-report-noicmp.html"
            echo "# OK."
            ;;
        "Recon nmap scan all ports")
echo "##############################################"
            echo "# Recon nmap scan all ports"
            echo "# Box Name:"
            read var_box_name
            sudo mkdir /root/Downloads/chacka0101/$var_box_name
            echo "# Create $var_box_name on /root/Downloads/chacka0101/$var_box_name"
            echo "# OK."
            echo "# RHOST IP:"
            read var_ip_all
            echo "# RHOST IP is: $var_ip_all"
            echo "# OK."
            echo "# Recon nmap scan all ports:"
            sudo nmap -T4 -p 1-65535 -sC -sV -v -oA /root/Downloads/chacka0101/$var_box_name/$var_ip_all-report-all --script vuln --stylesheet /root/Downloads/nmap-bootstrap.xsl $var_ip_all
            xsltproc -o /root/Downloads/chacka0101/$var_box_name/$var_ip_all-report-all.html /root/Downloads/chacka0101/Requirements/nmap-bootstrap.xsl /root/Downloads/chacka0101/$var_box_name/$var_ip_all-report-all.xml
            sudo xdg-open /root/Downloads/chacka0101/$var_box_name/$var_ip_all-report-all.html
            echo "# OK."          
            echo " Report: /root/Downloads/chacka0101/$var_box_name/$var_ip_all-report-all.html"
            echo "# OK."
            ;;
        "Recon WEB TECH with WAD - Web Application Detector")
echo "##############################################"
            echo "# Recon WEB TECH with WAD - Web Application Detector"
            echo "# Box Name:"
            read var_box_name
            sudo mkdir /root/Downloads/chacka0101/$var_box_name
            echo "# Create $var_box_name on /root/Downloads/chacka0101/$var_box_name"
            echo "# OK."
            echo "# IP or Domain and port. Example: 10.10.10.75:80 "
            read var_url_webwad       
            echo "# WEB: $var_url_webwad"
            echo "# OK."
            echo "# Recon WEB TECH with WAD - Web Application Detector:"
            wad -u http://$var_url_webwad/ > /root/Downloads/chacka0101/$var_box_name/Report-Web-Recon-Tech.txt
            echo "# OK."
            echo " Report: /root/Downloads/chacka0101/$var_box_name/Report-Web-Recon-Tech.txt"
            echo "# OK."
            ;;
        "Recon WEB directories and files HTTP and HTTPS")
 echo "##############################################"
            echo "# Recon WEB directories and files HTTP"
            echo "# Box Name:"
            read var_box_name
            sudo mkdir /root/Downloads/chacka0101/$var_box_name
            echo "# Create $var_box_name on /root/Downloads/chacka0101/$var_box_name"
            echo "# OK."
            echo "# IP or Domain and port. Example: 10.10.10.75:80 "
            read var_url_webhttp
            echo "# WEB: $var_url_webhttp"
            echo "# OK."
            echo "# Recon WEB directories:"
            gobuster -e -w /usr/share/wordlists/dirb/common.txt -u http://$var_url_webhttp/ -s "204,301,302,307,200,403" dir -f -t 40 > /root/Downloads/chacka0101/$var_box_name/Report-HTTP_quick.txt
            echo "# OK."
            echo "# Recon WEB directories and files HTTP:"
            gobuster -e -u http://$var_url_webhttp/ -w /usr/share/wordlists/dirb/common.txt -t 40 -x  .php,.txt,.html,.sh,.py,.pl,.cgi -s "204,301,302,307,200,403" -a CustomAgent -o /root/Downloads/chacka0101/$var_box_name/Report-HTTP_advanced.txt
            echo "# OK."
            echo "# Recon WEB directories and files HTTPS:"
            gobuster -e -k -u https://$var_url_webhttp/ -w /usr/share/wordlists/dirb/common.txt -t 40 -x  .php,.txt,.html,.sh,.py,.pl,.cgi -s "204,301,302,307,200,403" -a CustomAgent -o /root/Downloads/chacka0101/$var_box_name/Report-HTTPS_advanced.txt
            echo "# OK."
            echo " Report 1: /root/Downloads/chacka0101/$var_box_name/Report-HTTP_quick.txt"
            echo " Report 2: /root/Downloads/chacka0101/$var_box_name/Report-HTTP_advanced.txt"
            echo " Report 3: /root/Downloads/chacka0101/$var_box_name/Report-HTTPS_advanced.txt"          
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
