if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

#brew llvm
#export PATH="/usr/local/opt/ruby/bin:/usr/local/opt/llvm/bin:$PATH"
#export LDFLAGS="-L/usr/local/opt/llvm/lib"
#export CPPFLAGS="-I/usr/local/opt/llvm/include"

#export PATH="/usr/local/opt/ruby/bin:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
export PYTHON_CONFIGURE_OPTS="--enable-unicode=ucs4 --enable-framework"
export PATH="$PYENV_ROOT/bin:$PATH"
