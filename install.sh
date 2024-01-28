rm -rf Documents Downloads Music Pictures Public Templates Videos

echo "Kali VM Setup Script"
echo "Be ready to enter root password if needed..."
sleep 2
echo "Installing Heat"
sleep 2
sudo apt update && sudo apt dist-upgrade -y
sudo apt install -y curl zsh terminator vim binutils gobuster seclists dirsearch
sudo apt install -y feh python3-pip imagemagick
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

mkdir /opt/vpn
mkdir /opt/vpn/htb
mkdir /opt/vpn/os

echo "Important Notes:"
echo "Import Bookmarks..."
echo "Install Burp Pro..."
echo "Done"

rm -rf ./setup
