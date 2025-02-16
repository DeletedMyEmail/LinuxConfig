GREEN='\033[0;32m'
NC='\033[0m'

# sys update
sudo pacman -Syyu
# yay
sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
# install ui stuff
yay -S hyprland hyprpaper hyprlock wofi nwg-look waybar
# inistall other tools
yay -S kitty bitwarden yubioath-desktop snapd code blueman pavucontrol timeshift
curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh # atuin

# add scripts to bin
mkdir ~/bin
for path in scripts/*.sh; do
        filename=$(basename $path)
        cp scripts/${filename} ~/bin/${filename%.*}
        chmod +x ~/bin/${filename%.*}
done
echo -e "${GREEN}Bash commands added ${NC}"

# .config files
for path in configs/*; do
        path=$(basename $path)        
        cp -r configs/${path} ~/.config/
done
echo -e "${GREEN}.config files added ${NC}"

# git config
mkdir -p ~/Programming/Prv
mkdir -p ~/Programming/Uni
mkdir -p ~/Programming/Work
cp gitconfigs/gitconfig_prv ~/Programming/Prv/.gitconfig
cp gitconfigs/gitconfig_uni ~/Programming/Uni/.gitconfig
cp gitconfigs/gitconfig_work ~/Programming/Work/.gitconfig
cp gitconfigs/gitconfig_global ~/.gitconfig
echo -e "${GREEN}Git configured ${NC}"

# .bashrc
cp bashrc ~/.bashrc
. ~/.bashrc
echo -e "${GREEN}.bashrc file added ${NC}"