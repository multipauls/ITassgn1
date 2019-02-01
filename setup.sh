echo 'touch songlist.txt

if [ "$#" -lt 2  -o "$#" -gt 4 ]; then
	echo "Error. Please enter songname and singer (mandatory), and youtube link and genre (optional), in that order."
	exit 0
else

	x=$(awk -F"|"' \''{print $2, $3}' \'  'songlist.txt | grep -c "$1 $2")
	if [ "$x" -eq 0 ]; then
		
		id=$(tail -1 songlist.txt | awk -F"|" ' \''{print $1}' \'')
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
	
fi' > addentry.sh


echo 'if [ "$#" -lt 2 ]; then
	echo Error. Please enter songname and singer.
else
	x=$(grep -c "$1|$2" songlist.txt)
	if [ $x -ne 0 ]; then
		sed -i "/$1|$2/d" songlist.txt
		#cat songlist.txt
	else
        	echo Error. Entry not found.    
	fi	

fi' > deleteentry.sh

echo 'if [ "$#" -lt 2 ]; then
        echo Error. Please enter songname and singer.
else
	init1=$1
	init2=$2

	x=$(grep -c "$1|$2" songlist.txt)
        if [ $x -ne 0 ]; then
		y=$(grep "$1|$2" songlist.txt| awk -F"|"' \''{print $1}'\' ')
		z=$(grep "$1|$2" songlist.txt| awk -F"|"' \''{print $4}'\' ')
		w=$(grep "$1|$2" songlist.txt| awk -F"|"' \''{print $5}'\' ')

		echo Do you want to edit songname? [Y/N]
		read ans
		if [ "$ans" = "Y" -o "$ans" = "y" ]; then
			echo Enter new songname
			read nname
		else
			nname=$1
		fi

		echo Do you want to edit singer? [Y/N]
		read ans
		if [ "$ans" = "Y" -o "$ans" = "y" ]; then
        		echo Enter new singer
        		read nsinger
		else
			nsinger=$2
		fi
	
		echo Do you want to edit/add youtube link? [Y/N]
		read ans
		if [ "$ans" = "Y" -o "$ans" = "y" ]; then
        		echo Enter new youtube link
        		read nlink
		else
			nlink=$z
		fi	

		echo Do you want to edit genre? [Y/N]
		read ans
		if [ "$ans" = "Y" -o "$ans" = "y" ]; then
        		echo Enter new genre
        		read ngen
		else
			ngen=$w
		fi
		
		num=$(awk -F"|"' \''{print $2, $3}'\' ' songlist.txt | grep -c "$nname $nsinger")
        	if [ "$nname" = "$init1" -a "$nsinger" = "$init2" -o "$num" -eq 0 ]; then
			sed -i "/$1|$2/d" songlist.txt
			echo "$y|$nname|$nsinger|$nlink|$ngen"  >> songlist.txt
			sort -k 1 -t "|" songlist.txt > songlist2.txt
			mv songlist2.txt songlist.txt
		else
			echo Duplicate song.
		fi
	else
               	echo Error. Entry not found.
       	fi
fi' > editentry.sh

echo 'column -t -s'\''|'\' 'songlist.txt '> viewentry.sh

echo 'if [ "$#" -eq 0 ]; then
	echo Error. Please enter songname, singer, and/or genre.
elif [ "$#" -eq 1 ]; then 
	grep -i "$1" songlist.txt | column -t -s'\' '|' \''
elif [ "$#" -eq 2 ]; then
	grep -i "$1" songlist.txt | grep -i "$2" | column -t -s'\' '|' \'' 

elif [ "$#" -eq 3 ]; then
        grep -i "$1" songlist.txt | grep -i "$2" | grep "$3" | column -t -s'\' '|' \'' 


else
	echo Invalid choice
fi' > viewselect.sh
