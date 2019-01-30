if [ "$#" -eq 0 ]; then
	echo Error. Please enter songname, singer, and/or genre.
elif [ "$#" -eq 1 ]; then 
	grep -i "$1" songlist.txt | column -t -s'|'
elif [ "$#" -eq 2 ]; then
	grep -i "$1" songlist.txt | grep -i "$2" | column -t -s'|' 

elif [ "$#" -eq 3 ]; then
        grep -i "$1" songlist.txt | grep -i "$2" | grep "$3" | column -t -s'|' 


else
	echo Invalid choice
fi
