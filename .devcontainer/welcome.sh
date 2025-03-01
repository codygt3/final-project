#!/bin/bash
# Script to welcome user to codespace and remind them how to access the website

FONTS=("5lineoblique" "alligator" "big" "bigchief" "catwalk" "chunky")
WELCOME_MSG="Aloha, Coder!"
ENCODER_ENDPOINT="https://fastapi-text-asciify-npt1siwyq-ganmahmud.vercel.app/api/?"
PORT=3000
PREVIEW_URL="https://${CODESPACE_NAME}-${PORT}.app.github.dev"

# get rand font
array_length=${#FONTS[@]}
random_index=$((RANDOM % array_length))
font=${FONTS[$random_index]}

# Generate random ASCII welcome
clear
curl -sS "${ENCODER_ENDPOINT}text=${WELCOME_MSG}&font=${font}" | jq -r '.art' | sed 's/^/\x1b[32m/' | sed 's/$/\x1b[0m/'

# tl;dr: Microsoft sucks at automation so you need to manually click through each step to init
# l;r
# The codespace blocks the 'localhost', which is why the first attempt to preview the website fails BUT it launches the
# webserver behind the scenes. So when you click the link, you preview the website hosted at that codespace endpoint.
# You can view in a tab because you effectively open a browser page to view that external endpoint
echo "Hope you're ready to code!"
echo "To access your website, follow these steps 🚀"
echo "1. In the left-hand window, right click the file named 'index.html'"
echo -e "\t• If a popup asking for access to your clipboard comes up, you can click 'Allow'"
echo "2. Click the \"Show Preview\" option"
echo -e "\t• A tab will appear with the following message: \"This content is blocked. Contact the site owner to fix the issue.\" \e[1;32mDON'T PANIC\e[0m - this is ok :)"
echo -e "\t• Close the tab"
echo -e "3. You can now access your website here: \033[1;34m${PREVIEW_URL}\033[0m"
echo -e "\t• You can also click the green 'Open in Browser' button in the bottom right if a popup window appears there"
echo -e "\t• For tab view (After clicking the link): Right click 'index.html' and click the \"Show Preview\" option"
