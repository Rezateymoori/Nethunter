#! /bin/bash


echo update termux

pkg update -y

echo access internal storage

termux-setup-storage

echo install kali linux nethunter

pkg install wget
wget -O install-nethunter-termux https://offs.ec/2MceZWr
chmod 777 install-nethunter-termux
./install-nethunter-termux

echo run nethunter

nethunter

echo install xfce4 and vncserver

wget https://raw.githubusercontent.com/EXALAB/AnLinux-Resources/master/Scripts/DesktopEnvironment/Apt/Xfce4/de-apt-xfce4.sh && bash de-apt-xfce4.sh
vncserver

echo run vncserver

vncserver -kill :1
rm -f ~/.vnc/xstartup
echo -e '#!/bin/bash\nxrdb \$HOME/.Xresources\nstartxfce4 &' > ~/.vnc/xstartup
sudo chmod +x ~99/.vnc/xstartup
vncserver
vncserver-start

echo now you can start vnc remote program
