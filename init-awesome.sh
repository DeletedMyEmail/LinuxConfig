GREEN='\033[0;32m'
NC='\033[0m'

yes | sudo nala install awesome
cp awesome/ ~/.config/awesome -r
echo -e "${GREEN}Awesome wm installed and config files added ${NC}"
