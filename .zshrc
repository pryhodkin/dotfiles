# aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'

# git
zstyle ':completion:*:*:git:*' script ~/.zsh/git/.git-completion.bash
fpath=(~/.zsh/funstions $fpath)
autoload -Uz compinit && compinit
. ~/.zsh/git/.git-prompt.sh

# prompts
setopt PROMPT_SUBST
PS1='%B%F{green}%n%f%b:%F{blue}%~%f%F{yellow}$(__git_ps1 " (%s)")%f%B →%b '
