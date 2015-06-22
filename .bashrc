export EDITOR=nano
export PATH="$(/usr/local/bin/brew --prefix coreutils)"/libexec/gnubin:/usr/local/bin:$PATH:~/bin:.
export PS1="\[\033[36m\]\u\[\033[m\]: \[\033[33;1m\]\w\[\033[m\] $ "
export CLICOLOR=1
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD
alias ls="ls -GFh1a"
cdls() { cd "$@" && ls; }
alias ff="/Applications/Firefox.app/Contents/MacOS/firefox-bin"
alias ff-dev="/Applications/FirefoxDeveloperEdition.app/Contents/MacOS/firefox-bin"
alias firefox=ff
alias firefox-dev=ff-dev
alias lisp="rlwrap sbcl"
alias npm-exec='PATH=$(npm bin):$PATH'
alias gulp="npm-exec gulp"
alias rm="rm -i"
alias df="df -h"
