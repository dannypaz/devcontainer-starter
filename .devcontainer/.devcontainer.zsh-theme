setopt prompt_subst
# Git info
autoload -Uz vcs_info
zstyle ':vcs_info:git:*' formats '%F{green}(%b)%f'
zstyle ':vcs_info:*' enable git

# Main prompt with proper multi-line support
PROMPT=$'%{%F{blue}%}%n%{%f%} ➜ %{%F{cyan}%}%~%{%f%} ${vcs_info_msg_0_} %{%F{white}%}$%{%f%} '

# Command prompt
PROMPT2='%{%F{blue}%}%_%{%f%} ➜ '

# Selection prompt
PROMPT3='%{%F{blue}%}?%{%f%} ➜ '

# Correction prompt
PROMPT4='%{%F{blue}%}%e%{%f%} ➜ '
