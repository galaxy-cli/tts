#!/bin/bash
# Installs relevant packages for tts.sh
sudo apt install -y festival xsel git

# Check if tgpt directory exists before cloning and installing
if [ -d tgpt ]; then
    echo "tgpt is already installed (directory exists). Skipping clone and install."
else
    git clone https://github.com/aandrew-me/tgpt.git
    sh tgpt/install
fi
