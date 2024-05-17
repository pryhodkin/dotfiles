# colors
black           := \033[0;30m
bright_black    := \033[1;30m
red             := \033[0;31m
bright_red      := \033[1;31m
green           := \033[0;32m
bright_green    := \033[1;32m
yellow          := \033[0;33m
bright_yellow   := \033[1;33m
blue            := \033[0;34m
bright_blue     := \033[1;34m
magenta         := \033[0;35m
bright_magenta  := \033[1;35m
cyan            := \033[0;36m
bright_cyan     := \033[1;36m
white           := \033[0;37m
bright_white    := \033[1;37m
reset           := \033[0m


# colored tool names
zsh_colored      := $(bright_blue)zsh$(reset)
homebrew_colored := $(bright_blue)🍻Homebrew$(reset)
terminal_colored := $(bright_blue)terminal$(reset)
keyboard_colored := $(bright_blue)keyboard$(reset)
ssh_key_colored  := $(bright_blue)SSH key$(reset)
git_colored      := $(bright_blue)git$(reset)

# logging
log_info    := echo "$(blue)→$(reset)"
log_error   := echo "$(red)→$(reset)"
log_success := echo "$(green)→$(reset)"

new_line    := echo ""
success     := $(bright_green)<3$(reset)
failure     := $(bright_red)=($(reset)
