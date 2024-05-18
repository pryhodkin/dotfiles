.ONESHELL:
.SILENT:
.PHONY: help all brew terminal update-completions-repo keyboard ssh-key ssh-key-copy git

include visual.mk


help:
	$(new_line)
	$(log_info) "This Makefile is a tool to configure MacOS $(success)"
	$(new_line)

all: brew terminal keyboard ssh-key git


# HomeBrew
BREW := /usr/local/bin/brew

brew: $(BREW)

$(BREW):
	$(log_info) "installing $(homebrew_colored)..."
	/bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" \
	 && $(log_success) "$(homebrew_colored) installed successfully! $(success)" \
	 || $(log_error) "failed to install $(homebrew_colored) $(failure)"
###


# Terminal
ZSHRC          := $(HOME)/.zshrc
ZSH_HOME       := $(HOME)/.zsh
TERMINAL_THEME := vs-code-atom

terminal: $(TERMINAL_THEME).terminal $(ZSHRC) $(ZSH_HOME)
	$(log_info) "reconfiguring $(terminal_colored)..."
	open "$(TERMINAL_THEME).terminal" && \
	defaults write com.apple.Terminal "Default Window Settings" -string "$(TERMINAL_THEME)" && \
	defaults write com.apple.Terminal "Startup Window Settings" -string "$(TERMINAL_THEME)" \
	 && $(log_success) "$(terminal_colored) was reconfigured successfully! $(success)" \
	 || $(log_error) "failed to reconfigure $(terminal_colored) $(failure)"

update-completions-repo:
	mkdir -p ./.zsh/functions && \
	curl -o ./.zsh/.git-completion.bash https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash && \
	curl -o ./.zsh/functions/_git https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh \
	 && $(log_success) "$(zsh_colored) completions were updated successfully! Don't forget to commit $(success)" \
	 || $(log_error) "failed to update $(zsh_colored) completions $(failure)"

$(ZSHRC): ./.zshrc
	$(log_info) "$(zsh_colored) config changed since the last update, updating..."
	cp ./.zshrc $(ZSHRC) \
	 && $(log_success) "$(zsh_colored) config update succeed! $(success)" \
	 || $(log_error) "failed to update $(zsh_colored) config $(failure)"

$(ZSH_HOME): $(wildcard ./.zsh/*)
	$(log_info) "Updating $(zsh_colored) completions..."
	cp -r ./.zsh $(HOME) \
	 && $(log_success) "$(zsh_colored) completions updated successfully! $(success)" \
	 || $(log_error) "failed to update $(zsh_colored) completions $(failure)"
###


# Apple stupid keyboard setup fixes
keyboard:
	$(log_info) "configuring some $(keyboard_colored) features..."
	defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false \
	 && $(log_success) "$(keyboard_colored) features was reconfigured successfully! $(success)" \
	 || $(log_error) "failed to configure $(keyboard_colored) features $(failure)"
###


# SSH keys
SSH_KEY_FILE := $(HOME)/.ssh/id_ed25519

ssh-key: $(SSH_KEY_FILE).pub

ssh-key-copy: $(SSH_KEY_FILE).pub
	cat "$(SSH_KEY_FILE).pub" | pbcopy \
	 && $(log_success) "$(ssh_key_colored) (public) copied to clipboard successfully! $(success)" \
	 || $(log_error) "failed to copy $(ssh_key_colored) $(failure)"

$(SSH_KEY_FILE) $(SSH_KEY_FILE).pub:
	$(log_info) "genereting $(ssh_key_colored)..."
	ssh-keygen -t ed25519 -C "$$(whoami)@$$(hostname)" -f "$(SSH_KEY_FILE)" \
	 && $(log_success) "$(ssh_key_colored) were generated successfully! $(success)" \
	 || $(log_error) "failed to generate $(ssh_key_colored) $(failure)"
###


# Git
GITCONFIG := $(HOME)/.gitconfig

git: $(GITCONFIG)

$(GITCONFIG): ./.gitconfig
	$(log_info) "$(git_colored) config changed since the last update, updating..."
	cp ./.gitconfig $(GITCONFIG) \
	 && $(log_success) "$(git_colored) config update succeed! $(success)" \
	 || $(log_error) "failed to update $(git_colored) config $(failure)"
###
