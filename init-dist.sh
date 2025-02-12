# sys update
sudo apt update
yes | sudp apt upgrade

# nala
yes | sudo apt install nala
sudo nala fetch

# atuin
curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh

# replace .bashrc
cp .bashrc ~/.bashrc

# add scripts to bin

for path in scripts/*.sh; do
	filename=$(basename $path)
	cp "scripts/${filename}" "/home/joshua/bin/${filename%.*}"
	chmod +x "/home/joshua/bin/${filename%.*}"
done
