if [ $(whoami) == "root" ]; then
    echo "Script cannot be ran as root..."
    exit 1
fi

rm -rf Documents Downloads Music Pictures Public Templates Videos

echo "Kali VM Setup Script"
echo "Be ready to enter root password if needed..."
sleep 2
echo "Installing Heat"
sleep 2
sudo apt update && sudo apt dist-upgrade -y
sudo apt install -y curl zsh terminator vim binutils gobuster seclists dirsearch xclip

# Autorecon dependency check and install
echo "Installing autorecon"
sleep 1
sudo apt install -y python3
sudo apt install -y python3-pip
sudo apt install -y seclists curl dnsrecon enum4linux feroxbuster gobuster impacket-scripts nbtscan nikto nmap onesixtyone oscanner redis-tools smbclient smbmap snmp sslscan sipvicious tnscmd10g whatweb wkhtmltopdf
python3 -m pip install git+https://github.com/Tib3rius/AutoRecon.git

# rustscan install
echo "Installing rustscan"
sleep 1
wget https://github.com/RustScan/RustScan/releases/download/2.0.1/rustscan_2.0.1_amd64.deb
sudo dpkg -i rustscan_2.0.1_amd64.deb
rm rustscan_2.0.1_amd64.deb

sudo apt install -y feh imagemagick
sudo apt install -y neo4j bloodhound
sudo apt autoremove && sudo apt autoclean -y
sudo gem install evil-winrm

echo "Installing bloodhound"
sleep 1
sudo neo4j start
curl -L "https://github.com/BloodHoundAD/BloodHound/releases/download/v4.3.1/BloodHound-linux-x64.zip" --output /tmp/bloodhound.zip
sudo unzip /tmp/bloodhound.zip -d /opt

cp .fehbg ~/.fehbg
mkdir -p ~/.wallpaper
cp ~/setup/wallpaper.jpg ~/.wallpaper/wallpaper.jpg

echo "Installing Espanso"
curl -s https://api.github.com/repos/espanso/espanso/releases/latest  | grep -E "browser_download_url.*Espanso-X11.AppImage" | cut -d : -f 2,3 | tr -d \" | grep -v sha256 | wget -qi - -O espanso
chmod +x espanso && sudo mv espanso /usr/bin/espanso 
espanso service register
espanso start
cp ~/setup/dots/base.yml ~/.config/espanso/match/base.yml

sudo mkdir /opt/vpn && sudo mkdir /opt/vpn/htb && sudo mkdir /opt/vpn/os

echo "Important Notes:"
echo "Import Bookmarks..."
echo "Set Infinite Scrollback..."
echo "Set Wallpaper..."
echo "Set Host-Shared Folder..."
echo "Install Burp Pro..."
echo "Done"

rm -rf ./setup
