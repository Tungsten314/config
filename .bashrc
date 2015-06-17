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

search() {
    IFS='+'
    query="$*"
    # Substitute illegal characters
    query=${query//'$'/'%24'}
    query=${query//'&'/'%26'}
    query=${query//'+'/'%2B'}
    query=${query//','/'%2C'}
    query=${query//'/'/'%2F'}
    query=${query//':'/'%3A'}
    query=${query//';'/'%3B'}
    query=${query//'='/'%3D'}
    query=${query//'?'/'%3F'}
    query=${query//'@'/'%40'}
    query=${query//':'/'%3A'}
    query=${query//'"'/'%22'}
    query=${query//'<'/'%3C'}
    query=${query//'>'/'%3E'}
    query=${query//'#'/'%23'}
    query=${query//'%'/'%25'}
    query=${query//'{'/'%7B'}; query=${query//'}'/'%7D'}
    query=${query//'|'/'%7C'}
    query=${query//'\'/'%5C'}
    query=${query//'^'/'%5E'}
    query=${query//'~'/'%7E'}
    query=${query//'['/'%5B'}; query=${query//']'/'%5D'}
    query=${query//'`'/'%60'}
    
    open -b org.mozilla.FirefoxDeveloperEdition "https://duckduckgo.com/?q=$*"
}
