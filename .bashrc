alias l='ls -AFhl --color=always'
alias flushdns='sudo killall -HUP mDNSResponder; sleep 2; echo macOS DNS Cache Reset | say'
alias sleeplidon='sudo pmset -b sleep 0; sudo pmset -b disablesleep 1; echo MacBook Pro will not fall asleep when you close the lid | say'
alias sleeplidoff='sudo pmset -b sleep 5; sudo pmset -b disablesleep 0; echo MacBook Pro will fall asleep when you close the lid | say'

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
if [[ $host =~ ^MBPR ]]; then
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

# set prompt
PS1='\n\[\e[0;3${c}m\]\u\[\e[0m\] @ \[\e[1;3${c}m\]${host}\[\e[0m\] \[\e[1;36m\]\w\[\e[0m\] $(__git_ps1 "[%s]") \n\$ '
