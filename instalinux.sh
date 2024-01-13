#!/bin/bash

# GDZ instalinux v0.3
#
echo "██╗███╗   ██╗███████╗████████╗ █████╗ ██╗     ██╗███╗   ██╗██╗   ██╗██╗  ██╗";
echo "██║████╗  ██║██╔════╝╚══██╔══╝██╔══██╗██║     ██║████╗  ██║██║   ██║╚██╗██╔╝";
echo "██║██╔██╗ ██║███████╗   ██║   ███████║██║     ██║██╔██╗ ██║██║   ██║ ╚███╔╝ ";
echo "██║██║╚██╗██║╚════██║   ██║   ██╔══██║██║     ██║██║╚██╗██║██║   ██║ ██╔██╗ ";
echo "██║██║ ╚████║███████║   ██║   ██║  ██║███████╗██║██║ ╚████║╚██████╔╝██╔╝ ██╗";
echo "╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚═╝  ╚═╝";
echo "                                                                            ";
sleep 2
read -p "Skrypt instalacyjny linux, nacisnij dowolny klawisz..."

cd ~

sudo mkdir -p /opt/log
sudo mkdir -p /opt/skrypty
sudo mkdir -p /opt/backup

echo "Instalacja komponentow dodatkowych"
su apt install -y sudo &&
sudo apt update &&
sudo apt upgrade -y &&
sudo apt install -y build-essential git alsa-utils dialog
sudo apt install -y libasound2-dev g++ gcc make cmake groff gzip doxygen tar tcl
sudo apt install -y libspeex-dev libspeexdsp-dev libopus-dev libvorbis-dev
sudo apt install -y libpopt-dev libsigc++-2.0-dev
sudo apt install -y libgcrypt20-dev libgsm1-dev
sudo apt install -y librtlsdr-dev libjsoncpp-dev nodejs node-ws
sudo apt install -y bc tcl-dev libgpiod2 libgpiod-dev gawk lynx curl
sudo apt install -y libcurl4-openssl-dev curl libjson-perl libwww-perl
sudo apt install -y apache2 php libapache2-mod-php php-mbstring php-cgi php-common php-curl
sudo apt install -y git cmake libusb-1.0-0.dev build-essential gdebi
sudo apt install -y software-properties-common
sudo apt install -y libpython3-dev swig
sudo apt install -y avahi-daemon libavahi-client-dev
sudo apt install -y samba
sudo apt install -y pkg-config libusb-1.0
sudo apt install -y gettext nodejs make
sudo apt install -y software-properties-common


echo
echo "#################################################"
echo "Instalowac ZeroTier?"
echo "Opcja 1 - Instalacja + dolaczenie do sieci GDZ"
echo "Opcja 2 - Sama instalacja pakietu"
echo "Opcja 3 - Pominiecie instalacji"
echo " Q - Wyjdz z instalatora"
echo "#################################################"
echo
select option in 1 2 3 Q
do
case $option in
"1") echo "Instalacja ZeroTier" && curl -s https://install.zerotier.com | sudo bash && sudo service zerotier-one start && sudo zerotier-cli join 9bee8941b57a1201 ;;
"2") echo "Instalacja ZeroTier" && curl -s https://install.zerotier.com | sudo bash && sudo service zerotier-one start ;;
"3") echo "ZeroTier nie bedzie zainstalowany" && sleep 3 ;;
"Q") exit ;;
*) echo "Zly wybor mordo"
esac
break
done




echo
echo "#################################################"
echo "Instalowac pakiety do SDR?"
echo "Opcja 1 - Instalacja RTL-SDR + BLACKLIST"
echo "Opcja 2 - Instalacja RTL-SDR + RSP1 + BLACKLIST"
echo "Opcja 3 - Pominiecie instalacji"
echo " Q - Wyjdz z instalatora"
echo "#################################################"
echo
select option in 1 2 3 Q
do
case $option in
"1") echo "Instalacja RTL-SDR" && cd ~ && git clone git://git.osmocom.org/rtl-sdr.git && cd rtl-sdr/ && mkdir build && cd build && cmake ../ -DINSTALL_UDEV_RULES=ON -DDETACH_KERNEL_DRIVER=ON && make && sudo make install && sudo cp ../rtl-sdr.rules /etc/udev/rules.d/ && sudo ldconfig && echo "blacklist dvb_core
blacklist dvb_usb_rtl28xxu
blacklist dvb_usb_rtl2832u
blacklist dvb_usb_v2
blacklist e4000
blacklist fc0013
blacklist r820t
blacklist rtl2830
blacklist rtl2832
blacklist sdr_msi3101
blacklist msi001
blacklist msi2500" > no-rtl.conf && sudo mv no-rtl.conf /etc/modprobe.d/ ;;


"2") echo "Instalacja RTL-SDR + RSP1" && cd ~ && git clone git://git.osmocom.org/rtl-sdr.git && cd rtl-sdr/ && mkdir build && cd build && cmake ../ -DINSTALL_UDEV_RULES=ON -DDETACH_KERNEL_DRIVER=ON && make && sudo make install && sudo cp ../rtl-sdr.rules /etc/udev/rules.d/ && sudo ldconfig && cd ~ && git clone https://github.com/f4exb/libmirisdr-4.git && cd libmirisdr-4 && mkdir build; cd build && cmake -Wno-dev -DCMAKE_INSTALL_PREFIX=/opt/install/libmirisdr .. && make -j $(nproc) install && echo "blacklist dvb_core
blacklist dvb_usb_rtl28xxu
blacklist dvb_usb_rtl2832u
blacklist dvb_usb_v2
blacklist e4000
blacklist fc0013
blacklist r820t
blacklist rtl2830
blacklist rtl2832
blacklist sdr_msi3101
blacklist msi001
blacklist msi2500" > no-rtl.conf && sudo mv no-rtl.conf /etc/modprobe.d/ ;;


"3") echo "Pakiet SDR nie bedzie zainstalowany" && sleep 3 ;;


"Q") exit ;;
*) echo "Zly wybor mordo"
esac
break
done

cd ~

echo "Instalacja Cockpit"

sudo apt-get install -y cockpit &&

echo "Instalacja Cockpit-plugins..."
sleep 2
echo "Instalacja Cockpit-identities"
curl -LO https://github.com/45Drives/cockpit-identities/releases/download/v0.1.12/cockpit-identities_0.1.12-1focal_all.deb &&
sudo apt install ./cockpit-identities_0.1.12-1focal_all.deb
echo "Instalacja Cockpit-file-sharing"
curl -LO https://github.com/45Drives/cockpit-file-sharing/releases/download/v3.2.9/cockpit-file-sharing_3.2.9-2focal_all.deb
sudo apt install ./cockpit-file-sharing_3.2.9-2focal_all.deb

echo "Instalacja Cockpit-Temperature..."
cd ~
git clone https://github.com/pascal-fb-martin/cockpit-temperature-plugin
cd cockpit-temperature-plugin/
mkdir /usr/share/cockpit/cockpit-temperature-plugin
sudo cp -r * /usr/share/cockpit/cockpit-temperature-plugin/


echo "Instalacja Cockpit-Docker..."
cd ~
git clone https://github.com/mrevjd/cockpit-docker &&
cd cockpit-docker/
./install &&

echo "Instalacja Cockpit-SMB..."
cd ~
wget -O - https://raw.githubusercontent.com/enira/cockpit-smb-plugin/master/install.sh | sudo bash


echo "Instalacja Cockpit-Sensors..."
cd ~
wget https://github.com/ocristopfer/cockpit-sensors/releases/download/v1.4.1/cockpit-sensors.tar.xz && \
  tar -xf cockpit-sensors.tar.xz cockpit-sensors/dist && \
  mv cockpit-sensors/dist /usr/share/cockpit/sensors && \
  rm -r cockpit-sensors && \
  rm cockpit-sensors.tar.xz\
   

dialog --yesno "Instalujemy Dockera?" 8 40
wybor=$?
case $wybor in
"0" ) curl -fsSL https://test.docker.com -o test-docker.sh && sudo sh test-docker.sh && apt install docker-compose -y ;;
"1")  clear && echo "Docker nie bedzie zainstalowany" ;;
"255") clear && echo "Instalacja przerwana" ;;
esac

dialog --yesno "Instalujemy LazyDockera?" 8 40
wybor=$?
case $wybor in
"0" ) curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash ;;
"1")  clear && echo "LazyDocker nie bedzie zainstalowany" ;;
"255") clear && echo "Instalacja przerwana" ;;
esac


dialog --yesno "Instalujemy DockStation? ( TYLKO AMD64! )" 8 40
wybor=$?
case $wybor in
"0" ) wget https://github.com/DockStation/dockstation/releases/download/v1.5.1/dockstation_1.5.1_amd64.deb && gdebi dockstation_1.5.1_amd64.deb  ;;
"1")  clear && echo "DockStation nie bedzie zainstalowany" ;;
"255") clear && echo "Instalacja przerwana" ;;
esac
   
   
   
   
exit 0



