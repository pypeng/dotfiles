# Initialize FINK if needed

if [[ ! -x $(which fink) && -d /sw/bin ]];then
    source /sw/bin/init.sh
fi


# Set the DISPLAY variable ONLY for OS X earlier than 10.5
# Do not set it for 10.5, or it will create problems.


if [[ -z $DISPLAY && $(sw_vers -productVersion) < 10.5  && -z $SSH_CONNECTION ]]; then
    # -- works for Apple X11 with Fast User Switching
    disp_no=($( ps -awx | grep -F X11.app | awk '{print $NF}' | grep -e ":[0-9]"  ))
    if [[ -n $disp_no ]];then
        export DISPLAY=${disp_no}.0
    else
        export DISPLAY=:0.0
    fi
    echo "DISPLAY has been set to $DISPLAY"
fi


# iTerm Tab and Title Customization and prompt customization

# Put the string " [bash]   hostname::/full/directory/path"
# in the title bar using the command sequence
# \[\e]2;[bash]   \h::\]$PWD\[\a\]

# Put the penultimate and current directory
# in the iterm tab
# \[\e]1;\]$(basename $(dirname $PWD))/\W\[\a\]

# Make a simple command-line prompt:  bash-$

# PS1=$'\[\e]2;[bash]   \h::\]$PWD\[\a\]\[\e]1;\]$(basename "$(dirname "$PWD")")/\W\[\a\]bash-\$ '



#export LANG=en_US.UTF8

# Create a command to 'cd' to frontmost Finder window
# ref: http://www.macosxhints.com/article.php?story=20050924210643297
cdh()
{
       cd "`osascript -e 'tell application "Finder"' \
               -e 'set myname to POSIX path of (target of window 1 as alias)' \
               -e 'end tell' 2>/dev/null`"
}

#setting up file completion
if [ -f ~/.bash_completion ];
then
	. ~/.bash_completion;
fi

#advanced prompt settings
if [ -f ~/.bash_styles ];
then
	. ~/.bash_styles;
    twtty
fi

if [ -f ~/.inputrc ];
then
	. ~/.inputrc;
fi

# You may uncomment the following lines if you want `ls' to be colorized:
export LS_OPTIONS='--color=auto --show-control-chars'
#eval `dircolors`

alias rm='rm -i '
alias cp='cp -i '
alias mv='mv -i '
alias df='df -h '
alias ll='ls -F $LS_OPTIONS -al --color=auto '
alias l='ls -F $LS_OPTIONS -l --color=auto '
alias vi='vim '
alias less='less -R '

alias egrep='egrep --color=tty -d skip'
alias fgrep='fgrep --color=tty -d skip'
alias grep='grep --color=tty -d skip'

alias rdp='export XLIB_SKIP_ARGB_VISUALS=1;rdesktop -a 24 '
alias diff='colordiff '
alias S='screen '
alias M='mutt '
alias mplayer='mplayer -stop-xscreensaver'
alias mplayer-c='mplayer -subcp cp936 -font /usr/share/fonts/fireflysung/fireflysung.ttf '

# python autocomplete
export G_FILENAME_ENCODING="@locale"
export PYTHONSTARTUP=~/.pythonrc.py

# For colourful man pages (CLUG-Wiki style)
#export LESS_TERMCAP_mb=$'\E[01;31m'
#export LESS_TERMCAP_md=$'\E[01;31m'
#export LESS_TERMCAP_me=$'\E[0m'
#export LESS_TERMCAP_se=$'\E[0m'
#export LESS_TERMCAP_so=$'\E[01;44;33m'
#export LESS_TERMCAP_ue=$'\E[0m'
#export LESS_TERMCAP_us=$'\E[01;34m'

#export PATH=/usr/lib/ccache/bin:/usr/lib/distcc/bin:/usr/lib/colorgcc/bin:/usr/local/bin:$PATH

export LANG=en_US.UTF8

#Specify that it must be pressed twice to exit:
export IGNOREEOF=1

export TERM=xterm-color
#alias e='/Applications/Emacs.app/Contents/MacOS/bin/emacsclient -n'
#alias emacs='/Applications/Emacs.app/Contents/MacOS/bin/emacsclient -a vim'
alias emacs='/usr/bin/emacs'
#alias vi="emacs -c"
export EDITOR=vi #emacs
#export VISUAL=emacs

export PATH=/Developer/usr/bin/:/opt/local/bin:/opt/local/sbin:/opt/local/Library/Frameworks/Python.framework/Versions/2.6/bin/:/Users/py/Code/go/bin:$PATH
export PYTHONPATH=$PYTHONPATH:/Library/Python/2.6/site-packages/
