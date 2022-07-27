#!/bin/bash

mkdir /root/bashrc_backup

cp /root/.bashrc /root/bashrc_backup

mv uninstall-rude.sh /root/uninstall-rude.sh

echo "We have backed up your bashrc, which is stored in the bashrc_backup folder(you should be able to find it), because uninstalling rude-terminal will delete bashrc that's currently in the root directory."

PS3="Choose a version to install: "

select choice in clean explict exit; do
case ${choice} in
clean) mv clean.sh  ~/.rude  ;;
explict) mv explict.sh  ~/.rude ;;
exit) exit

cat << EOF >> ~/.bashrc
PROMPT_COMMAND="prompt=1"
trap 'cmd=\$BASH_COMMAND; \
[[ "\$prompt" && "\$cmd" != "\$PROMPT_COMMAND" ]] && \
~/.rude; unset prompt' DEBUG

"Thank you for installing rude-terminal. If you would like to uninstall it, run bash uninstall-rude.sh on root directory."
