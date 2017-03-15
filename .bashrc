alias l='ls -AFhl --color=always'
alias srprsme='cd ~/development/srprsme && source srprsme/bin/activate && export DJANGO_SETTINGS_MODULE=srprsme_website.local_settings'

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
elif [[ $host =~ ^MBA ]]; then
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
