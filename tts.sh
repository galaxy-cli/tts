#!/bin/bash
#       | |_| |_ ___   ___| |__ 
#       | __| __/ __| / __| '_ \ 
#       | |_| |_\__ \_\__ \ | | |
#        \__|\__|___(_)___/_| |_|
# https://github.com/galaxey-cli/tts
# tts.sh - Simple text-to-speech utility using Festival and optional GPT integration

# Dependency checks
command -v festival >/dev/null 2>&1 || { echo "festival not found"; exit 1; }

# Edit Festival speed by changing Duration_Stretch in:
# /usr/share/festival/voices/english/kal_diphone/festvox/kal_diphone.scm
# Line 265: (Parameter.set 'Duration_Stretch 0.8)

print_usage() {
    cat <<EOF
USAGE
  ./tts.sh -x           # Speak clipboard contents
  ./tts.sh -o FILE      # Speak contents of FILE
  ./tts.sh -e           # Speak user input (one line)
  ./tts.sh -t           # Speak output from tgpt

FLAGS
  -x    Use clipboard (xsel)
  -o    Open and speak a file
  -e    Echo user input
  -t    Use tgpt output
EOF
}

# Storages temporary script files in /tmp/
tmpfile=$(mktemp /tmp/tts.XXXXXX)
trap 'rm -f "$tmpfile"' INT EXIT

speak_clipboard() {
        xsel | festival --tts
}
speak_file() {
        open "$1" && festival --tts < "$1"
}
speak_input() {
        read -r tts
        echo "$tts" | festival --tts
}
speak_tgpt() {
        command -v tgpt >/dev/null 2>&1 || { echo "tgpt not found"; exit 1; }
        tgpt > "$tmpfile"
        open "$tmpfile"
        festival --tts "$tmpfile"
}

case "${1:-}" in
    -x) speak_clipboard ;;
    -o) speak_file "${2:-}" ;;
    -e) speak_input ;;
    -t) speak_tgpt ;;
    *)  print_usage ;;
esac
