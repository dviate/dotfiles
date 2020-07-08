alias l='ls -AFhl --color=always'
alias flushdns='sudo killall -HUP mDNSResponder; sleep 2; echo macOS DNS Cache Reset | say'

# since aliases don't accept extra parameters, we're creating a function instead of an alias
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
