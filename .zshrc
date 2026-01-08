
# onefetch if in repository else fastfetch
if git rev-parse --git-dir > /dev/null 2>&1; then
	onefetch
else
	fastfetch
fi

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# source plugins
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# doesn't work on kitty but does on ubuntu konsole?
# source /usr/share/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

autoload -Uz compinit && compinit
# zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# history
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
setopt hist_ignore_space

# aliases
alias hypr="nvim .config/hypr/hyprland.conf"
alias ls="ls --color --group-directories-first"
alias cd="z"
alias zat="zathura --fork"
alias todo="taskell ~/.todo.md"
alias tod="taskell .todo.md"
alias shade="hyprshade on blue-light-filter"
alias noshade="hyprshade off"
alias joke="curl https://v2.jokeapi.dev/joke/Programming -s | jq ".joke" | cowsay | lolcat"
alias py="python"
alias swl="cd swl && sudo systemctl start docker && docker start dwl-mysql && npm run dev"

compdef -d pacman
compdef -d npm

eval "$(zoxide init zsh)"
