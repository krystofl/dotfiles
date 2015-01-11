# Krystof's ZSH Theme - managed by oh-my-zsh
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

local user_host='%n@%m%'
local current_dir=' %~%'

PROMPT="${user_host} ${current_dir}
$ "
