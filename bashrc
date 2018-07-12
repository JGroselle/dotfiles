# Locale
LANG=en_US.UTF-8

# screenfetch
echo '' ; screenfetch

# Aliases
## Modified command
alias grep='grep --color=auto'

## ls
alias ls='ls -hF --color=auto'
alias lr='ls -R'                    # recursive ls
alias ll='ls -l'
alias la='ll -A'
alias lx='ll -BX'                   # sort by extension
alias lz='ll -rS'                   # sort by size
alias lt='ll -rt'                   # sort by date
alias l='ls -Alh'

## Safety features
alias cp='cp -i'
alias mv='mv -i'
# safer alternative w/ timeout, not stored in history
alias rm=' timeout 3 rm -Iv --one-file-system'
alias ln='ln -i'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

## Make Bash error tolerant
alias :q=' exit'
alias :Q=' exit'
alias :x=' exit'
alias cd..='cd ..'

# shell optional behavior
for option in autocd cdspell histappend ; do
  shopt -s "$option"
done

# Git
# shellcheck disable=SC1091
source /usr/share/git/completion/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE='1'
export GIT_PS1_SHOWUNTRACKEDFILES='1'
export GIT_PS1_SHOWUPSTREAM='verbose name'

# PS1
PS1='\[\e[0;33m\][\t] \[\e[0;32m\]\u@\H \[\e[0;33m\]\w \[\e[0;35m\]$(__git_ps1 "(%s)")\n\[\e[0;33m\]$\[\e[0m\] '

# ssh-agent
SSH_ENV="${HOME}/.ssh/environment"
SSH_KEY="${HOME}/.ssh/id_rsa"
ssh-agent | sed 's/^echo/#echo/' | dd of="${SSH_ENV}" 2> /dev/null
if [ -e "${SSH_ENV}" ] ; then 
    chmod 600 "${SSH_ENV}"
    # shellcheck source=${SSH_ENV}
    # shellcheck disable=SC1091
    source "${SSH_ENV}"
else
    echo 'Failed.'
fi
[ -r "${SSH_KEY}" ] && $(command -v ssh-add) "${SSH_KEY}"

