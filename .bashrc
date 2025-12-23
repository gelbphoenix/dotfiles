# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command
shopt -s checkwinsize

if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
   PS1=$'\n\[\e[38;5;244m\]\u256D\u2500\u2500\[\e[38;5;197m\] ( \u ) \[\e[38;5;244m\]\u2500\[\e[38;5;199m\] [ \W ]$(__git_ps1 " \[\e[38;5;244m\]\u2500\[\e[38;5;196m\] < %s > ")\n\[\e[38;5;244m\]\u2570\u2500\u2500\u2500\u2192\[\e[0m\] '
else
   PS1=$'\n\u256D\u2500\u2500 ( \u )\u2500 [ \W ]$(__git_ps1 " \u2500 < %s > ")\n\u2570\u2500\u2192 '
fi
unset color_prompt force_color_prompt

case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
fi

# Alias definitions.
[ -f $HOME/.bash_aliases ] && \. $HOME/.bash_aliases
[ -f $HOME/.config/git/prompt ] && \. $HOME/.config/git/prompt

# enable programmable completion features
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

export PATH="$HOME/.local/bin:$PATH"

# node version manager
if [ -d $HOME/.nvm ]; then
	NVM_DIR="$HOME/.nvm"
	[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
	[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi

# console-ninja
[ -d $HOME/.console-ninja ] && export PATH="$HOME/.console-ninja/.bin:$PATH"

# bun
if [ -d $HOME/.bun ]; then
	BUN_INSTALL="$HOME/.bun"
	export PATH="$BUN_INSTALL/bin:$PATH"
	[ -f "$HOME/.local/share/bash_completion/bun" ] && \. "$HOME/.local/share/bash_completion/bun" # This loads the bun bash completions
fi

# NVIDIA CUDA
if [ -d /usr/local/cuda ]; then
	export PATH="/usr/local/cuda/bin:$PATH"
	export LD_LIBRARY_PATH="/usr/local/cuda/lib64"
fi

