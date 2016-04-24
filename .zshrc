#---------------------------------------------------------------------------------------
#
# See
# http://www.acm.uiuc.edu/workshops/zsh/prompt/escapes.html
# http://stevelosh.com/blog/2010/02/my-extravagant-zsh-prompt/ for suggestions
# https://github.com/sjl/oh-my-zsh/
# https://github.com/robbyrussell/oh-my-zsh
#
#---------------------------------------------------------------------------------------

export ENABLE_VCS_INFO="yes"
export VCS_INFO_SHOW_TRACKING_BRANCH="yes" # if you want to display tracking branch

setopt noautomenu
setopt nomenucomplete

# don't like these
#setopt listambiguous
#setopt noautolist

if [ -f  ~/.ssh-agent-info ]
then
    source ~/.ssh-agent-info
fi

eval $(dircolors -b $HOME/.dircolors)
export CLICOLOR=true


#---------------------------------------------------------------------------------------
# Handy functions
#---------------------------------------------------------------------------------------
function collapse_pwd {
    echo $(pwd | sed -e "s,^$HOME,~,")
}

function getPID()
{
    ps ax | grep "$@"
}

function pp()
{
    cd ~
}

function pd()
{
    popd >/dev/null 2>/dev/null
    if [ $? -eq 1 ] ; then
        cd ~
    fi
}

function gbb()
{
  git branch --set-upstream $@ origin/$@
}

function select-folder()
{
    dirs=($1/*)
    f=0
    for dirname in "${dirs[@]}" ; do
        echo "$((++f)): $dirname"
    done

    read "selection?Select $2 > "
    cd $dirs[$selection]
}
alias sf="select-folder"

function select-workspace()
{
    select-folder "/workplace/$USER" "Workspace"
}
alias sw="select-workspace"

u () {
    set -A ud
    ud[1+${1-1}]=
    cd ${(j:../:)ud}
}

#---------------------------------------------------------------------------------------
# Set up standard BASH variables
#---------------------------------------------------------------------------------------
export WORDCHARS='*_[]~&!#%^(){}<>'
export BRAZIL_WORKSPACE_GITMODE='awesome'
export OVERRIDE_EDITOR="emacs" # set several editing prefs at once
export EDITOR='emacs'
export P4EDITOR='emacs'
export HISTIGNORE=' *:&'
export LESS='-FRnqSX'
export TERM=xterm-color
export LC_CTYPE=en_US.UTF-8
# AUTO_TITLE_SCREENS="NO"                # (or "YES") to turn screen auto-titling on or off
# LONG_TITLE="YES"                       # Set a longer title, including host and more path


#---------------------------------------------------------------------------------------
# Load Colors and Setup Prompt
#---------------------------------------------------------------------------------------
autoload -U colors && colors
for COLOR in RED GREEN YELLOW BLUE MAGENTA CYAN BLACK WHITE; do
    eval $COLOR='%{$fg_no_bold[${(L)COLOR}]%}'  #wrap colours between %{ %} to avoid weird gaps in autocomplete
    eval BOLD_$COLOR='%{$fg_bold[${(L)COLOR}]%}'
done
eval RESET='%{$reset_color%}'

zstyle ':vcs_info:*' formats '(%b%u%c)%m'

RPROMPT=''
PS1="%{$CYAN%}%m$BLUE(%n)$CYAN$RESET:$CYAN%2~$MAGENTA%1v$CYAN%% $RESET"


#---------------------------------------------------------------------------------------
# Set up aliases
#---------------------------------------------------------------------------------------
alias bsr="bundle exec rspec"
alias be="bundle exec"
alias bo="bundle open"
# alias fm="bundle exec foreman start"
# alias rc="bundle exec rails c"

alias fl='fc -l'

alias l='less'

alias ll='ls -lF'
alias la='ls -AlF'

alias rc="sudo runCommand"
alias cb="cd /workplace/dixonb"

# TMUX aliases
alias tn='tmux new -s'
alias ta='tmux attach -t'
alias tw='tmux switch -t'
alias tl='tmux list-sessions'
alias td='tmux detach'

# Git aliases
alias gup='git push'
alias gdl='git pull'
alias ga='git add'
alias gc='git commit'
alias gf='git fetch'
alias gh='git help'
alias gi='git init'
alias gl='git log'
alias gd='git diff'
alias gdc='git diff --cached'
alias gdh='git diff HEAD'
alias gb='git branch'
alias gbl='git blame -L'
alias gt='git tag'
alias gm='git merge'
alias gs='git status'
alias go='git checkout'
alias gr='git rebase -i'
alias gss='git stash save'
alias gsa='git stash apply'
alias gsp='git stash pop'
alias gsl='git stash list'
alias gsc='git stash clear'
alias gbd='git checkout brendan.dixon'

alias "?"='pwd'
