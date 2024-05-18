# prompts
PS1='%B%F{green}%n%f%b:%F{blue}%~%f%B →%b '

# aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'

# git
zstyle ':completion:*:*:git:*' script ~/.zsh/.git-completion.bash
fpath=(~/.zsh/funstions $fpath)
autoload -Uz compinit && compinit
