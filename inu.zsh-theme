#theme for zsh prompt


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







VIRTUAL_ENV_DISABLE_PROMPT=1
venv_info() {
    [ $VIRTUAL_ENV ] && echo "$fg_bold[$NEW_COLOR]%}(%{$fg[$VENV_COLOR]%}$my_orange$(basename $VIRTUAL_ENV)%{$fg_bold[$NEW_COLOR]%})"
}


PROMPT=$'%{$fg_bold[$LIN_COLOR]%}╭─% $FG[214]%}%(!.#.»)%(?,,%{$fg_bold[$LINE_COLOR]%}[%{$fg_bold[$ERR_COLOR]%}✗%{$reset_color%}%{$fg_bold[$LINE_COLOR]%}]─)$(venv_info)%{$reset_color%}%{$fg_bold[$NEW_COLOR]%}[%{$fg_bold[$USER_COLOR]%}%n%{$fg[$AT_COLOR]%}@%{$fg[$HOST_COLOR]%}%m%{$reset_color%}%{$fg_bold[$NEW_COLOR]%}]%{$fg_bold[$DIR_COLOR]%}%~%{$fg[$LINE_COLOR]%}
%{$fg[$LIN_COLOR]%}╰──➤%{$fg_bold[$PROMPT_COLOR]%}$my_purple%(!.#.$)%{$reset_color%}'


#RPROMPT='$(nvm_prompt_info) $(my_git_prompt)'
