# .bashrc
# If not running interactively, don't do anything and return early
[[ $- == *i* ]] || return

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# locale
export LC_ALL="en_US.UTF-8"

# User specific aliases and functions
export PATH="$HOME/bin:$PATH"
if [ -f "$HOME/.bash/alias" ]; then
    source "$HOME/.bash/alias"
fi
if [ -f "$HOME/.bash/color" ]; then
    source "$HOME/.bash/color"
fi

eval "$(pyenv virtualenv-init -)"

