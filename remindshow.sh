if [ "$#" = 0 ]; then
	sort -t"|" -k2 remindlist.txt| column -t -s'|'

elif [ "$1" = "-d" ]; then
	grep "$2" remindlist.txt | sort -t"|" -k1 | column -t -s'|'
else
        grep "$3" remindlist.txt | sort -t"|" -k1 | column -t -s'|'
fi


