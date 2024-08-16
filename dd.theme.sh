#! bash oh-my-bash.module

# rr is a simple one-liner prompt inspired by robbyrussell from ohmyzsh themes.
#
# Looks:
#
# ➜  anish ~ cd .bash-it/themes/dulcie
# ➜  anish custom-dulcie git:(master ✓) # with git
#
# Configuration. Change these by adding them in your .bash_profile

function _omb_theme_PROMPT_COMMAND() {
  local arrow="${_omb_prompt_bold_purple}➜${_omb_prompt_reset_color}"
  local user_name="${_omb_prompt_white}\u${_omb_prompt_reset_color}"
  local base_directory="${_omb_prompt_bold_blue}\W${_omb_prompt_reset_color}"

  PS1="${arrow}  ${user_name} ${base_directory} "
}

_omb_util_add_prompt_command _omb_theme_PROMPT_COMMAND
