#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'
PROJECT_NAME=$1
TEMPLATE_REPO="https://github.com/DeletedMyEmail/ProjectTemplates.git"
TEMPLATE_PATH="$HOME/Programming/Prv/ProjectTemplates"

# Check if the ProjectTemplates directory exists
if [ -d "$TEMPLATE_PATH" ]; then
    echo -e "${GREEN}Template found${NC}"
    cd "$TEMPLATE_PATH"
    git pull || { echo -e "${RED}Git pull failed${NC}"; exit 1; }
	cd ..    
	echo -e "${GREEN}Repo updated${NC}"

# clone if not
else
    echo -e "${GREEN}Template not found. Cloning...${NC}"
    cd "$HOME/Programming/Prv"
    git clone "$TEMPLATE_REPO" "$TEMPLATE_PATH" || { echo -e "${RED}Git clone failed${NC}"; exit 1; }
    echo -e "${GREEN}Template cloned${NC}"
fi

# Ensure the target project directory exists
mkdir -p "$PROJECT_NAME" || { echo -e "${RED}Failed to create directory $PROJECT_NAME${NC}"; exit 1; }

# Copy template files
cp -r "$TEMPLATE_PATH/." "$PROJECT_NAME/" || { echo -e "${RED}Copy failed${NC}"; exit 1; }

# Edit template
cd $PROJECT_NAME
sed -i "s/ProjectTemplates/$PROJECT_NAME/g" CMakeLists.txt
rm -rf .git/
git init
echo -e "${GREEN}Project name injected into template and git initialized${NC}"

echo -e "${GREEN}Project ${PROJECT_NAME} created${NC}"
