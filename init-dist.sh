GREEN='\033[0;32m'
NC='\033[0m'

# sys update
sudo apt update
yes | sudo apt upgrade
echo -e "${GREEN}System updated ${NC}"
echo

# install tools
# nala
yes | sudo apt install nala
sudo nala fetch
echo -e "${GREEN}Nala installed ${NC}"
echo
# curl
yes | sudo nala install curl
# atuin
curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh
echo -e "${GREEN}Atuin installed ${NC}"
echo
# git
yes | sudo nala install git
echo -e "${GREEN}Git installed ${NC}"
echo
# flatpak
yes | sudo nala install flatpak
yes | flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install org.freedesktop.Platform
# brave
yes | flatpak install flathub com.brave.Browser
echo -e "${GREEN}Brave installed ${NC}"
echo
# bitwarden
yes | flatpak install flathub com.bitwarden.desktop
echo -e "${GREEN}Bitwarden installed ${NC}"
echo

# .bashrc
cp bashrc ~/.bashrc

# make dirs
mkdir ~/bin
mkdir -p ~/Programming/Prv
mkdir -p ~/Programming/Uni
mkdir -p ~/Programming/Work


# add scripts to bin
for path in scripts/*.sh; do
        filename=$(basename $path)
        cp "scripts/${filename}" "~/bin/${filename%.*}"
        chmod +x "~/bin/${filename%.*}"
done
echo -e "${GREEN}Bash commands added ${NC}"

# git config
cp gitconfigs/gitconfig_prv ~/Programming/Prv/.gitconfig
cp gitconfigs/gitconfig_uni ~/Programming/Uni/.gitconfig
cp gitconfigs/gitconfig_work ~/Programming/Work/.gitconfig
cp gitconfigs/gitconfig_global ~/.gitconfig
echo -e "${GREEN}Git configured ${NC}"

# reload
. ~/.bashrc
