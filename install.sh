#!/bin/bash
#       | |_| |_ ___   ___| |__ 
#       | __| __/ __| / __| '_ \ 
#       | |_| |_\__ \_\__ \ | | |
#        \__|\__|___(_)___/_| |_| 
# https://github.com/galaxey-cli/tts
# tts.sh - Simple text-to-speech utility using Festival and optional GPT integration

sudo apt update
sudo apt install -y festival xsel git

# Check if tgpt directory exists before cloning and installing
if [ -d tgpt ]; then
    echo "tgpt is already installed (directory exists). Skipping clone and install."
else
    git clone https://github.com/aandrew-me/tgpt.git
    sh tgpt/install
fi
