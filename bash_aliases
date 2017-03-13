#!/bin/bash

android_sdk="$HOME/Tools/android-sdk"
export PATH="$PATH:$android_sdk/tools:$android_sdk/platform-tools"
export EDITOR=vim
export LESS='-iRw'
export GCC_VER=$(gcc -dumpversion)
#export GEM_HOME=/var/lib/gems/1.8
export NODE_PATH=/usr/local/lib/jsctags/:$NODE_PATH
export CHROME_BIN=chromium-browser
export PROMPT_DIRTRIM=2
export JAVA_HOME=/usr/lib/jvm/java-8-oracle

# Verification will fail with self-signed certs, I guess...
export GIT_SSL_NO_VERIFY=1

alias ls='ls -lhF --color=auto \
  --group-directories-first --time-style=+"%F %T"'
alias view='view -M'
alias cp='cp -i'
alias rm='rm -I --one-file-system --preserve-root'
alias chmod='chmod --preserve-root'
alias chown='chown -h --preserve-root'
alias chgrp='chgrp -h --preserve-root'
alias diff='diff -u'
alias vless=/usr/share/vim/vim74/macros/less.sh

# TODO Get rid of messages w/o disown
#function gvim {
#  /usr/bin/gvim -f $* > /dev/null 2> /dev/null & disown
#}

function dict() {
  /usr/bin/dict -d gcide $* | colorit
}

#  is bound to stop the flow, even if there is no flow,
# while the key sequence is needed elsewhere (e.g. history search)
stty stop undef
stty start undef # reason similar to `stop'
stty werase undef # for "\C-w" to work

# TODO for some fucking reason it doesn't work for bash,
#      when put into `~/.inputrc'
bind -m emacs '"\e\C-j": vi-editing-mode'
bind '"\C-w": backward-kill-word'
