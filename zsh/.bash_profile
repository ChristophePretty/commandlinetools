if [[ $- == *i* ]]; then
	VERBOSE=1
else
	VERBOSE=0
fi

export LC_ALL=en_US.UTF-8  
export LANG=en_US.UTF-8

export DISPLAY=:0

if [[ $VERBOSE == 1 ]]; then
	echo DISPLAY = $DISPLAY
fi

#export EDITOR=subl

export PATH="/usr/local/sbin:/usr/local/bin:$PATH"

alias h=history
alias ls='ls -FG'
alias ll='ls -FG -l'
alias la='ls -FG -a'

alias mvim="open -a MacVim.app $*"

alias cdgogo='cd `git rev-parse --git-dir | sed "s/\(.*\)\.git.*/\1/"`'
alias cdny='cd `git rev-parse --git-dir | sed "s/\(.*\)\.git.*/\1/"`dependencies/NewYork/'
alias cdcocos='cd `git rev-parse --git-dir | sed "s/\(.*\)\.git.*/\1/"`dependencies/NewYork/mobile/dependencies/cocos2d-x'

#alias rgpy='find . \( -name "*.py" \) -print | xargs grep'
#alias rgc='find . \( -name "*.c" -o -name "*.cxx" -name "*.cpp" \) -print | xargs grep'
#alias rgh='find . \( -name "*.h" -o -name "*.hxx" \) -print | xargs grep'
#alias rg='find . | xargs grep'

#export PAGER=less

export JAVA_HOME=$(/usr/libexec/java_home -v '1.8*')

export HADOOP_OPTS="$HADOOP_OPTS -Djava.library.path=/Users/christophegenova/dev/tools/hadoop_native_osx"

alias setgo="export GOPATH=`pwd`"

#export ZKC_SERVERS=zookeeper1:2181
#export ZKC_FORMAT=json

#export SPARK_HOME=$HOME/dev/Analytics/spark-2.0.2-bin-hadoop2.7/
#export SPARK_HOME=$HOME/dev/Analytics/spark-2.0.1-bin-hadoop2.7/
#export PATH="$SPARK_HOME/bin:$PATH"

alias gitlog="git log --oneline --graph --decorate --parents"

cd .
