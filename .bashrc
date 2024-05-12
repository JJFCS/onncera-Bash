# IF NOT RUNNING INTERACTIVELY, DON'T DO ANYTHING
[[ $- != *i* ]] && return


# IGNORE UPPER & LOWERCASE WHEN TAB COMPLETION
bind "set completion-ignore-case on"


# managing system dotfiles (git bare)
# maintaining system's bashrc
alias bashie="/usr/bin/git --git-dir=/home/onncera/.versioncontrol/BASH --work-tree=/home/onncera"


# show the list of packages that need this package - depends mpv as example
function_depends()  {
	search=$(echo "$1")
	sudo pacman -Sii $search | grep "Required" | sed -e "s/Required By     : //g" | sed -e "s/  /\n/g"
	}
alias depends='function_depends'


alias main='cd ~/main'
alias ls='ls --color=auto'
alias la='ls -a'
alias ll='ls -ald -ALNvh *'
alias ..="cd .."

alias audio="pactl info | grep 'Server Name'"     # check pulseaudio or pipewire
alias boot="sudo bootctl status | grep Product"   # grub or systemd-boot
alias caps2ctrl="setxkbmap -option ctrl:nocaps"   # makes caps an additional ctrl
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)'  # clean orphaned packages
alias grep='grep --color=auto'                    # colorises the grep command output
alias kernels="ls /usr/lib/modules"               # list of kernels installed
alias update='sudo pacman -Syyu'                  # performs normal update (no aur included)
alias updateall="paru -Syu"                       # paru as our aur helper - helps to update everything
alias xd="ls /usr/share/xsessions"                # xsessions deskops installed

alias yta-best="yt-dlp --extract-audio --audio-format best "                                                      # youtube download best audio   quality
alias yta-mp3="yt-dlp --extract-audio --audio-format mp3 "                                                        # youtube download mp3  audio   quality
alias ytv-normal="yt-dlp -v -f 'bv*[height<=720][ext=mp4]+ba*[ext=m4a]' -N 4"                                     # youtube download normal video quality
alias ytv-best="yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' --merge-output-format mp4 " # youtube download best   video quality
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"                                     # list of recently installed packages (rip) (short - 200  items)
alias riplong="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -3000 | nl"                                # list of recently installed packages (rip) (long  - 3000 items)
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"                   # get fastest mirrors in your neighborhood

shopt -s autocd                                   # change to named directory
shopt -s cdspell                                  # autocorrects cd misspellings
shopt -s checkwinsize                             # checks term size when bash regains control
shopt -s cmdhist                                  # save multi-line commands in history as single line
shopt -s dotglob
shopt -s expand_aliases                           # expand aliases
shopt -s histappend                               # do not overwrite history


# # usage: ex <file>
ex ()
{
	if [ -f $1 ] ; then
		case $1 in
			*.tar.bz2)   tar xjf $1   ;;
			*.tar.gz)    tar xzf $1   ;;
			*.bz2)       bunzip2 $1   ;;
			*.rar)       unrar x $1   ;;
			*.gz)        gunzip $1    ;;
			*.tar)       tar xf $1    ;;
			*.tbz2)      tar xjf $1   ;;
			*.tgz)       tar xzf $1   ;;
			*.zip)       unzip $1     ;;
			*.Z)         uncompress $1;;
			*.7z)        7z x $1      ;;
			*.deb)       ar x $1      ;;
			*.tar.xz)    tar xf $1    ;;
			*.tar.zst)   tar xf $1    ;;
			*)           echo "'$1' cannot be extracted via ex()" ;;
		esac
	else
		echo "'$1' is not a valid file"
	fi
}

echo
cd ~/main

PS1="\[\e[1;33m\]{\W} >>\[\e[0;37m\] "
