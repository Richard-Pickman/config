# run for interactive shells only
[[ $- != *i* ]] && return

PATH=~/bin:$PATH

if [[ "$(uname -s)" == "Darwin" ]]; then
  PATH=~/bin/bin_mac:$PATH
elif [[ "$(uname -s)" == "Linux" ]]; then
  PATH=~/bin/bin_linux:$PATH
fi

if [[ -f /usr/local/bin/nvim-linux-x86_64/bin/nvim ]]; then
  alias vi=/usr/local/bin/nvim-linux-x86_64/bin/nvim
elif [[ -f /usr/local/bin/nvim-linux-x86_64/bin/nvim ]]; then
  alias vi=/usr/local/bin/nvim-linux-arm64/bin/nvim
elif [[ -f /opt/homebrew/bin/nvim ]]; then
  alias vi=/opt/homebrew/bin/nvim
fi

alias c=clear
alias p=pwd
alias l='ls -a'
alias ls='ls --color=auto'
alias b='cd ..;pwd'
alias type='type -a'
alias code='code --disable-gpu'

# Use vi navigation with bash.
set -o vi

#PROMPT_COMMAND='printf "\\e]9;9;%s\\a" "$PWD"; '"${PROMPT_COMMAND:-}"
#PS1='\[\033[0;94m\]\u@\h $ \[\033[0m\]'
PS1='\[\033[0;94m\]$ \[\033[0m\]'

# display line number when debugging bash scripts
export PS4="+ \${LINENO} "

export CODEX_CONFIG_PATH="$HOME/.codex/config.toml"

export HISTCONTROL=ignoredups

PROMPT_COMMAND='printf "\033]7;%s\007" "file://${PWD}"'

if [[ -f ~/bin_linux_main/calendar.py ]]; then
  ~/bin_linux_main/calendar.py
fi

~/motd.bash
