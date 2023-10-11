#my theme

typeset +H my_purple="$FG[129]"
LINE_COLOR=red
LIN_COLOR=red
ERR_COLOR=red
USER_COLOR=red
NEW_COLOR=blue
AT_COLOR=yellow
HOST_COLOR=cyan
DIR_COLOR=magenta
PROMPT_COLOR=blue
GIT_BRANCH_COLOR=white
GIT_STATUS_COLOR=red
WHITE_COLOR=white
typeset +H my_orange="$FG[214]"
PS2_PROMPT_COLOR=green


#Git prompt
ZSH_THEME_GIT_PROMPT_PREFIX="[%{$fg_bold[green]%} 🌿 %{$reset_color%}%{$fg_bold[white]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} ]"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}✓%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg[cyan]%}▴%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_BEHIND="%{$fg[magenta]%}▾%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg_bold[green]%}●%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNSTAGED="%{$fg_bold[yellow]%}●%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg_bold[red]%}●%{$reset_color%}"

my_git_branch () {
  ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(command git rev-parse --short HEAD 2> /dev/null) || return
  echo "${ref#refs/heads/}"
}
my_git_status() {
  _STATUS=""

  # check status of files
  _INDEX=$(command git status --porcelain 2> /dev/null)
  if [[ -n "$_INDEX" ]]; then
    if $(echo "$_INDEX" | command grep -q '^[AMRD]. '); then
      _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_STAGED"
    fi
    if $(echo "$_INDEX" | command grep -q '^.[MTD] '); then
      _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_UNSTAGED"
    fi
    if $(echo "$_INDEX" | command grep -q -E '^\?\? '); then
      _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_UNTRACKED"
    fi
    if $(echo "$_INDEX" | command grep -q '^UU '); then
      _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_UNMERGED"
    fi
  else
    _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_CLEAN"
  fi

  # check status of local repository
  _INDEX=$(command git status --porcelain -b 2> /dev/null)
  if $(echo "$_INDEX" | command grep -q '^## .*ahead'); then
    _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_AHEAD"
  fi
  if $(echo "$_INDEX" | command grep -q '^## .*behind'); then
    _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_BEHIND"
  fi
  if $(echo "$_INDEX" | command grep -q '^## .*diverged'); then
    _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_DIVERGED"
  fi
 if $(command git rev-parse --verify refs/stash &> /dev/null); then
    _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_STASHED"
  fi

  echo $_STATUS
}

my_git_prompt () {
  local _branch=$(my_git_branch)
  local _status=$(my_git_status)
  local _result=""
  if [[ "${_branch}x" != "x" ]]; then
    _result="$ZSH_THEME_GIT_PROMPT_PREFIX$_branch"
    if [[ "${_status}x" != "x" ]]; then
      _result="$_result $_status"
    fi
    _result="$_result$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
  echo $_result
}


VIRTUAL_ENV_DISABLE_PROMPT=1
venv_info() {
    [ $VIRTUAL_ENV ] && echo "$fg_bold[$NEW_COLOR]%}(%{$fg[$VENV_COLOR]%}$my_orange$(basename $VIRTUAL_ENV)%{$fg_bold[$NEW_COLOR]%})"
}

PROMPT=$'%{$fg_bold[$LIN_COLOR]%}╭─% $FG[214]%}%(!.#.»)%(?,,%{$fg_bold[$LINE_COLOR]%}[%{$fg_bold[$ERR_COLOR]%}✗%{$reset_color%}%{$fg_bold[$LINE_COLOR]%}]─)$(venv_info)%{$reset_color%}%{$fg_bold[$NEW_COLOR]%}[ 🍀 %{$fg_bold[$USER_COLOR]%}%n%{$fg[$AT_COLOR]%} @ 💻 %{$fg[$HOST_COLOR]%}%m%{$reset_color%}%{$fg_bold[$NEW_COLOR]%} ]%{$fg_bold[$DIR_COLOR]%} in 📁 %~%{$fg[$LINE_COLOR]%}
%{$fg[$LIN_COLOR]%}╰──${FG[077]}▶%{$fg_bold[$PROMPT_COLOR]%} $my_purple%(!.#.$)%{$reset_color%}'


RPROMPT='$(nvm_prompt_info) $(my_git_prompt)'
                                                 
