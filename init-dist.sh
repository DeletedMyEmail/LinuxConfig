# sys update
sudo apt update
yes | sudp apt upgrade


# install tools
# nala
yes | sudo apt install nala
sudo nala fetch
# atuin
curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh
# git
yes | sudo nala install git


# .bashrc
cp bashrc ~/.bashrc


# add scripts to bin --------------------------------
for path in scripts/*.sh; do
	filename=$(basename $path)
	cp "scripts/${filename}" "/home/joshua/bin/${filename%.*}"
	chmod +x "/home/joshua/bin/${filename%.*}"
done


# make dirs
mkdir -p /home/joshua/Programming/Prv
mkdir -p /home/joshua/Programming/Uni
mkdir -p /home/joshua/Programming/Work

# git config
cp gitconfig_prv /home/joshua/Programming/Prv/.gitconfig
cp gitconfig_uni /home/joshua/Programming/Uni/.gitconfig
cp gitconfig_work /home/joshua/Programming/Work/.gitconfig
cp gitconfig_global /home/joshua/.gitconfig
