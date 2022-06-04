sudo pacman -Syu --needed base-devel
git clone https://aur.archlinux.org/paru-bin.git
cd paru-bin && makepkg -si

sudo timedatectl set-ntp true && sudo timedatectl set-local-rtc 1 --adjust-system-clock

# Installing packages
paru -S --noconfirm alacritty alsa-tools alsa-utils audacious-plugins-gtk3 audacious-gtk3 brillo blueman bluez bluez-utils btop dbus-python discord dk dunst firefox-developer-edition fluent-cursor-theme-git fluent-icon-theme-git github-desktop-bin gnome-screenshot gparted gvfs htop jdk-temurin light lightdm lightdm-gtk-greeter lxappearance maim matcha-gtk-theme mesa mpv multimc-bin neofetch nerd-fonts-jetbrains-mono network-manager-applet nitrogen noto-fonts-emoji ntfs-3g pamixer pavucontrol pipewire pipewire-alsa pipewire-pulse picom polkit-gnome powertop polybar refind rofi skeuos-gtk spotify spotify-adblock sxhkd tar thunar touche touchegg transmission-gtk ttf-ms-fonts ttf-unifont unzip viewnior vscodium-bin whatsapp-nativefier-dark xclip xorg yt-dlg zip zoom zsh 

for service in bluetooth NetworkManager touchegg.service; do
  sudo systemctl enable --now $service
done

git clone https://github.com/Z-8Bit/Dk.git ~/Downloads/Dk

# Creating directories
mkdir -p ~/.config/{alacritty,audacious,dk,dunst,neofetch,polybar,rofi,touchegg}
# Making Thunar default file manager
xdg-mime default thunar.desktop inode/directory

# Copying dotfiles
chmod +x ~/Downloads/Dk/dk/* && cp ~/Downloads/Dk/dk/* ~/.config/dk/
cp ~/Downloads/Dk/alacritty/alacritty.yml ~/.config/alacritty/
cp -r ~/Downloads/Dk/audacious/* ~/.config/audacious/
cp -r ~/Downloads/Dk/dunst/* ~/.config/dunst/
cp ~/Downloads/Dk/rofi/* ~/.config/rofi/
cp ~/Downloads/Dk/touchegg/touchegg.conf ~/.config/touchegg/
cp ~/Downloads/Dk/neofetch/config.conf ~/.config/neofetch/
cp ~/Downloads/Dk/polybar/* ~/.config/polybar/

# Scripts and Miscellaneous
chmod +x ~/Downloads/Dk/scripts/*.sh
sudo cp ~/Downloads/Dk/scripts/*.sh /usr/bin/
sudo cp ~/Downloads/Dk/misc/30-touchpad.conf /etc/X11/xorg.conf.d
cp ~/Downloads/Dk/misc/xprofile ~/.xprofile
cp ~/Downloads/Dk/misc/picom.conf ~/.config/

git clone https://github.com/Z-8Bit/Wallpapers ~/Pictures/Wallpapers
RED='\033[0;31m'

sleep 5
echo -e "${RED}Please add ~/Pictures/Wallpapers in nitrogen's preferences."

sudo cp ~/Downloads/Dk/misc/lightdm-gtk-greeter.conf /etc/lightdm/
sudo cp ~/Pictures/Wallpapers/artwork.jpg /etc/lightdm/background.jpg

# Refind theming and installation
# refind-install
# git clone https://github.com/josephsurin/refind-theme-circle.git && sudo rm -r ./refind-theme-circle/{screenshots,.git}
# sudo cp -r refind-theme-circle /boot/efi/EFI/refind/ && sudo echo "include refind-theme-circle/theme.conf" >> /boot/efi/EFI/refind/refind.conf

echo -e "{$RED}Reboot now and then enable lightdm (sudo systemctl enable lightdm.service)."



