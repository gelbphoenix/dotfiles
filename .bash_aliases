### Aliases ###
# clear #
alias cls='clear'
alias acls='history -c; clear'

# list #
alias list='ls -lACF'

# home directory #
alias ~='cd ~'

# better system commands #
if [ "$(lsb_release -si)" = "Debian" ]; then
	if [ -x "$(command -v nala)" ]; then
		alias apt='sudo nala'
	else
		alias apt='sudo apt'
		alias apt-update='apt update && apt upgrade'
	fi
elif ["$(lsb_release -si)" = "Fedora"]; then
	alias dnf='sudo dnf'
fi

alias mkdir='mkdir -pv'
alias rmdir='rm -rdv'

# confirmations #
alias mv='mv -i'
alias cp='cp -i'
alias rm='rm -I'

# commands with sudo #

# kde commands #
alias plasmareset='killall plasmashell; kstart plasmashell'

# script commands #

### Functions ###
up () {
	local d=""
	local limit="$1"

	# Default to limit of 1
	if [ -z "$limit" ] || [ "$limit" -le 0 ]; then
		limit=1
	fi

	for ((i=1;i<=limit;i++)); do
		d="../$d"
	done

	# perform cd. Show error if cd fails
	if ! cd "$d"; then
		echo "Konnte nicht $limit Verzeichnisse hochgehen.";
	fi
}
