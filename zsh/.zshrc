# Path to your oh-my-zsh installation.
export ZSH=/Users/christophegenova/.oh-my-zsh
source ~/.bash_profile

export DEFAULT_USER=`whoami`

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="Agnoster"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(pip aws python brew golang osx make)

# User configuration

# OLDPATH=/Users/christophegenova/dev/android/android-ndk-r10e:/Users/christophegenova/dev/android/sdks/platform-tools:/Users/christophegenova/dev/android/sdks/tools:/usr/local/sbin:/usr/local/bin:/Applications/MacVim.app/Contents/MacOS:/Users/christophegenova/dev/android/android-ndk-r10e:/Users/christophegenova/dev/android/sdks/platform-tools:/Users/christophegenova/dev/android/sdks/tools:/usr/local/sbin:/usr/local/bin:/Applications/MacVim.app/Contents/MacOS:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/go/bin:$HOME/dev/Delaware/"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='subl'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
function rg(){ grep -n -R -I --exclude='*.so' --exclude='*.so.*' --exclude='*.a' --color=auto  "$@" ./ }
function rgc(){ grep -n -R -I --color=auto --include='*.c' --include='*.cxx' --include='*.cc' --include='*.cpp' "$@" ./ }
function rgpy(){ grep -n -R -I --color=auto --include='*.py' "$@" ./ }
function rggo(){ grep -n -R -I --color=auto --include='*.go' "$@" ./ }
function rgch(){ grep -n -R -I --color=auto --include='*.[ch]' --include='*.[ch]xx' --include='*.cc' --include='*.cpp' "$@" ./ }
function rgcxx(){ grep -n -R -I --color=auto --include='*.cxx' --include='*.cc' --include='*.cpp' "$@" ./ }
function rgh(){ grep -n -R -I --color=auto --include='*.h' --include='*.hxx' --include='*.hh' --include='*.hpp' "$@" ./ }
function rgj(){ grep -n -R -I --color=auto --include='*.java' "$@" ./ }
function rgl(){ grep -n -R -I --color=auto --include='*.htm' --include='*.html' --include='*.xml' "$@" ./ }
function rgp(){ grep -n -R -I --color=auto --include='*.py' "$@" ./ }
function rgph(){ grep -n -R -I --color=auto --include='*.php' "$@" ./ }
function rgsnappy(){ find . -type f -name "*.snappy" | xargs snzip -kdc | grep "$@" }

function sshaws(){ ssh -o StrictHostKeyChecking=no -i ~/.aws/supertracker-key-aws.pem ec2-user@$@ }

function timestamp() { date -j -u -f %s $@ }
function timestampms() { date -j -u -f %s $(( $@/1000 )) }

function switch2java18() { export JAVA_HOME=$(/usr/libexec/java_home -v '1.8*') }
function switch2java17() { export JAVA_HOME=$(/usr/libexec/java_home -v '1.7*') }

function cdfinder() { cd "$(osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)')" }

function dupretty() { du -hx * | sort -rh | head -30 }

#setopt print_exit_value
setopt no_share_history

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


COCOSROOT="/Users/christophegenova/dev/minimalcc"

# Add environment variable COCOS_CONSOLE_ROOT for cocos2d-x
export COCOS_CONSOLE_ROOT=$COCOSROOT/cocos2d-x/tools/cocos2d-console/bin
export PATH=$COCOS_CONSOLE_ROOT:$PATH

# Add environment variable COCOS_X_ROOT for cocos2d-x
export COCOS_X_ROOT=$COCOSROOT/
export PATH=$COCOS_X_ROOT:$PATH

# Add environment variable COCOS_TEMPLATES_ROOT for cocos2d-x
export COCOS_TEMPLATES_ROOT=$COCOSROOT/cocos2d-x/templates
export PATH=$COCOS_TEMPLATES_ROOT:$PATH

# Add environment variable NDK_ROOT for cocos2d-x
export NDK_ROOT=/Users/christophegenova/dev/android/android-ndk-r13b
export PATH=$NDK_ROOT:$PATH

# Add environment variable ANDROID_SDK_ROOT for cocos2d-x
export ANDROID_SDK_ROOT=/Users/christophegenova/dev/android/sdks
export PATH=$ANDROID_SDK_ROOT:$PATH
export PATH=$ANDROID_SDK_ROOT/tools:$ANDROID_SDK_ROOT/platform-tools:$PATH

# Add environment variable ANT_ROOT for cocos2d-x
export ANT_ROOT=/usr/local/Cellar/ant/1.10.1/bin
export PATH=$ANT_ROOT:$PATH

# Add gnu bin
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

# Add environment variable COCOS_X_ROOT for cocos2d-x
export COCOS_X_ROOT="/Users/christophegenova/dev/minimalcc"
export PATH=$COCOS_X_ROOT:$PATH
