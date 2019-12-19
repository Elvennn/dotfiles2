# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/adrien/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    docker
    docker-compose
    alias-tips
    ember-cli
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias grho='grhh origin/$(git symbolic-ref --short HEAD)'
alias wglog="watch --color -n 1 git log --oneline --decorate --color --graph"

alias yadmgrb="cd ~/workspace/dotfiles2/ && git checkout work && git rebase master && git checkout perso && git rebase master && git checkout home && git rebase perso && git checkout laptop && git rebase perso && git push origin --all -f"
export PATH=$PATH:/opt/gradle/gradle-5.6.3/bin
export FRONT_ROOT=~/workspace/concord-app-front
export FRONT=$FRONT_ROOT/services/front
export BACK=~/workspace/Negotiation-App
export SIGNER=~/workspace/SignerService/stack/signer
export E2E=~/workspace/concord-e2e-tests
export TOMCAT=~/workspace/tools/apache-tomcat-8.5.46

alias sone="~/.screenlayout/simple.sh && $HOME/.config/polybar/launch.sh > /tmp/null"
alias sdual="~/.screenlayout/dual.sh && $HOME/.config/polybar/launch.sh > /tmp/null"
alias scopy=~"/.screenlayout/dual.sh && $HOME/.config/polybar/launch.sh > /tmp/null"

alias ports="sudo lsof -i -P -n | grep LISTEN"

alias sproxy="docker-compose -f $FRONT_ROOT/docker-compose.yml up -d --build dev-proxy"

alias frontr="cd $FRONT_ROOT"
alias front="cd $FRONT"
alias ufront="frontr && ./utils/updateFront.sh"
alias uftrad="frontr && ./utils/nego.py po all"
alias sfront="sproxy && ufront && front && npm run serve"
alias ftr="frontr && utils/nego.py po all && cd -"

alias back="cd $BACK"
alias bback="back && rm -f $BACK/target/*.war ; mvn package -DskipTests"
alias rback="bback && cp $BACK/target/*.war $TOMCAT/webapps/contract-live.war && rwar"
alias rwar="JAVA_OPTS=-Dspring.profiles.active=DEV,AWS $TOMCAT/bin/catalina.sh run"
alias ssigner="cd $SIGNER && rm -f $SIGNER/target/*war ; mvn package && cp $SIGNER/target/*.war $TOMCAT/webapps/signer.war"
alias sback="ssigner && back && ./utils/updateBack.sh && rback"

alias e2e="cd $E2E"
alias re2e="e2e && mvn clean test -P headless -D workers=10"

alias apiary='docker run --rm --interactive --tty --volume "$(pwd)":"$(pwd)" --workdir "$(pwd)" --publish 81:8080 apiaryio/client preview --server --host=0.0.0.0 --watch'
