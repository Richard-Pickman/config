if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

export PATH="$(brew --prefix grep)/libexec/gnubin:$PATH"

eval "$(/opt/homebrew/bin/brew shellenv bash)"
