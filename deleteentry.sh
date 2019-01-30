if [ "$#" -lt 2 ]; then
	echo Error. Please enter songname and singer.
else
	x=$(grep -c "$1|$2" songlist.txt)
	if [ $x -ne 0 ]; then
		sed -i "/$1|$2/d" songlist.txt
		#cat songlist.txt
	else
        	echo Error. Entry not found.    
	fi	

fi
