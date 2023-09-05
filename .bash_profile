# .bash_profile
# User specific environment and startup programs
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$HOME/.local/bin:$HOME/bin:$PATH"
eval "$($PYENV_ROOT/bin/pyenv init -)t"

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

export PATH
