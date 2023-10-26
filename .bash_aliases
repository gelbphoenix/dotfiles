### Aliases ###
# clear #
alias cls='clear'
alias acls='history -c; clear'

# list #
alias list='ls -lACF'

# home directory #
alias ~='cd ~'

# better system commands #
alias apt='sudo nala'
alias mkdir='mkdir -pv'

# confirmations #
alias mv='mv -i'
alias cp='cp -i'
alias rm='rm -i'

# commands with sudo #
alias brctl='sudo brctl'

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
