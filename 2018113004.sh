exec 2>/dev/null
mkdir $2/Bad
mkdir $2/Good
mkdir $2/Average
mkdir $2/Awesome

pathfile=$2
filename=$1
len1=$(wc -l $filename | awk '{print $1}') 


i=0
while [ "$i" -le "$len1" ]
do
	var1=$(awk -F':' '{print $1}' $filename | head -$i | tail -1)
	var2=$(awk -F':' '{print $2}' $filename | head -$i | tail -1)
	#echo $var2
	a=9.0
	b=8.0
	c=5.0
	i=$(($i+1))
	
	if [ "$(echo $var2'>'$a | bc -l)" -eq "1" ]; then
 		touch $pathfile/Awesome/$var1.mp4
	
	elif [ "$(echo $var2'>'$b | bc -l)" -eq "1" ]; then
                touch $pathfile/Good/$var1.mp4
	
	elif [ "$(echo $var2'>'$c | bc -l)" -eq "1" ]; then
                touch $pathfile/Average/$var1.mp4
	
	else  
		touch $pathfile/Bad/$var1.mp4
	fi

	exec 2> /dev/null

done

