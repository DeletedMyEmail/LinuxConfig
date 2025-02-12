GREEN='\033[0;32m'

# sys update
sudo apt update
yes | sudo apt upgrade
echo -e "${GREEN}System updated"
echo

# install tools
# nala
yes | sudo apt install nala
sudo nala fetch
echo -e "${GREEN}Nala installed"
echo
# curl
yes | sudo nala install curl
# atuin
curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh
echo -e "${GREEN}Atuin installed"
echo
# git
yes | sudo nala install git
echo -e "${GREEN}Git installed"
echo
# flatpak
yes | sudo nala install flatpak
yes | flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
# brave
yes | flatpak install flathub com.brave.Browser
echo -e "${GREEN}Brave installed"
echo
# bitwarden
yes | flatpak install flathub com.bitwarden.desktop
echo -e "${GREEN}Bitwarden installed"
echo

# .bashrc
cp bashrc ~/.bashrc

# make dirs
mkdir /home/joshua/bin
mkdir -p /home/joshua/Programming/Prv
mkdir -p /home/joshua/Programming/Uni
mkdir -p /home/joshua/Programming/Work


# add scripts to bin --------------------------------
for path in scripts/*.sh; do
        filename=$(basename $path)
        cp "scripts/${filename}" "/home/joshua/bin/${filename%.*}"
        chmod +x "/home/joshua/bin/${filename%.*}"
done
echo -e "${GREEN}Bash commands added"

# git config
cp gitconfig_prv /home/joshua/Programming/Prv/.gitconfig
cp gitconfig_uni /home/joshua/Programming/Uni/.gitconfig
cp gitconfig_work /home/joshua/Programming/Work/.gitconfig
cp gitconfig_global /home/joshua/.gitconfig
echo -e "${GREEN}Git configured"

# reload
. ~/.bashrc
