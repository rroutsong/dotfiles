# .bashrc
# If not running interactively, don't do anything and return early
[[ $- == *i* ]] || return  

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
export LC_ALL="en_US.UTF-8"

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
export PATH="$HOME/bin:$PATH"
if [ -f "$HOME/.bash/alias" ]; then
   source "$HOME/.bash/alias"
fi
if [ -f "$HOME/.bash/color" ]; then
   source "$HOME/.bash/color"
fi

# slurm job id in prompt string
if [[ -z "${SLURM_JOB_ID}" ]]; 
then
    [ -d /scratch/routsongrm ] || mkdir /scratch/routsongrm
    export TMPDIR=/scratch/routsongrm
    export PS1="[\u@\h \W]\$ "
else
    export TMPDIR=/lscratch/$SLURM_JOB_ID
    export PS1="[\u@\h \W] {$SLURM_JOB_ID}\\$ "
fi

# biowulf specifics
umask 007

# singularity cache
SINGULARITY_CACHEDIR=/data/OpenOmics/SIFs/.routsongrm
