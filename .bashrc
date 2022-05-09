alias l='ls -AFhl --color=always'
alias flushdns='sudo killall -HUP mDNSResponder; sleep 2; echo macOS DNS Cache Reset | say'
alias sleeplidon='sudo pmset -b sleep 0; sudo pmset -b disablesleep 1; echo MacBook Pro will not fall asleep when you close the lid | say'
alias sleeplidoff='sudo pmset -b sleep 5; sudo pmset -b disablesleep 0; echo MacBook Pro will fall asleep when you close the lid | say'
alias cs='cd ~/development/work/campspace/campspace.com'

# since aliases don't accept extra parameters, we're creating a function instead of an alias
# reference: https://stackoverflow.com/questions/7131670/make-a-bash-alias-that-takes-a-parameter
acme() {
    dig -t txt _acme-challenge."$1" +short
}

# os x is a special little snowflake... (aka stupid)
if [ `uname` = 'Darwin' ]; then
	export CLICOLOR=1
	export LSCOLORS=ExGxcxdxCxegedabagacad
	alias l='ls -AFhl'
fi

c=1

# host-specific colouring
host=`hostname`
if [[ $host =~ ^Jermaine ]]; then
	c='4'
	host='(づ｡◕‿‿◕｡)づ 彡┻━┻ '
elif [ $host = 'vps01' ]; then
	c='6'
	host='(ノಠ益ಠ)ノ彡┻━┻'
fi

# git completion + prompt
source ~/.git-completion.bash
source ~/.git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUPSTREAM='auto'

# iCulture/MAMP stuff
PHP_VERSION=$(ls /Applications/MAMP/bin/php/ | sort -n | tail -1)
export PATH=/Applications/MAMP/bin/php/${PHP_VERSION}/bin:$PATH

alias wp='php /Applications/MAMP/bin/php/${PHP_VERSION}/bin/wp-cli.phar'
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# set prompt
PS1='\n\[\e[0;3${c}m\]\u\[\e[0m\] @ \[\e[1;3${c}m\]${host}\[\e[0m\] \[\e[1;36m\]\w\[\e[0m\] $(__git_ps1 "[%s]") \n\$ '

export ES_JAVA_HOME='/Library/Java/JavaVirtualMachines/jdk-13.0.1.jdk/Contents/Home'
#export PATH=$ES_JAVA_HOME/bin:$PATH
