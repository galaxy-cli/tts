#!/bin/bash
############
#          #
#  tts.sh  #
#          #
############

#
# TTS SPEED
#
# /usr/share/festival/voices/english/kal_diphone/festvox/kal_diphone.scm
#
# Line 265 (Parameter.set 'Duration_Stretch 0.8)
#

traptts(){

	trap "rm -f tts" INT EXIT

}

case "$1" in

	-x) xsel | festival --tts ;;

	-o) open "$2" && festival --tts < "$2" ;;

	-e) read -r tts; echo "$tts" | festival --tts ;;

	-t) traptts; tgpt > tts; open tts; festival --tts tts ;;

	*)
		printf "USAGE:\n"

		printf "tts -x [XSEL]\n"

		printf "tts -o [OPEN FILE]\n"

		printf "tts -e [ECHO]\n"

		printf "tts -t [TGPT]\n"

esac
