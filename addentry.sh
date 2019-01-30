touch songlist.txt

if [ "$#" -lt 2  -o "$#" -gt 4 ]; then
	echo "Error. Please enter songname and singer (mandatory), and youtube link and genre (optional), in that order."
	exit 0
else

	x=$(awk -F"|" '{print $2, $3}'  songlist.txt | grep -c "$1 $2")
	if [ "$x" -eq 0 ]; then
		
		id=$(tail -1 songlist.txt | awk -F'|' '{print $1}')
		id=$(($id + 1))
		
		if [ "$#" -eq 2 ]; then
			echo "$id|$1|$2||" >> songlist.txt
			exit 0
		elif [ "$#" -eq 3 ]; then
			echo "$id|$1|$2|$3|" >> songlist.txt
			exit 0
		elif [ "$#" -eq 4 ]; then
			echo "$id|$1|$2|$3|$4" >> songlist.txt
			exit 0		
		fi 
		exit 0	
	else
		echo Duplicate song
		exit 0
	fi
	exit 0
	
fi
