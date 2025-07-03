# tts.sh
Simple text-to-speech utility using Festival and optional GPT integration

## USAGE:
> ./tts.sh -x           # Speak clipboard contents
-./tts.sh -o FILE      # Speak contents of FILE
  ./tts.sh -e           # Speak user input (one line)
  ./tts.sh -t           # Speak output from tgpt

## FLAGS:
  -x    Use clipboard (xsel)
  -o    Open and speak a file
  -e    Echo user input
  -t    Use tgpt output
