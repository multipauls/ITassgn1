mkdir $2/Bad
mkdir $2/Good
mkdir $2/Average
mkdir $2/Awesome

len1=$(wc -l $1 | awk '{print $1}') 

#echo $len1
i=0
while [ "$i" -le "$len1" ]
do
	var1=$(awk -F':' '{print $1}' movies_input | head -$i | tail -1)
	var2=$(awk -F':' '{print $NF}' movies_input | head -$i | tail -1)
	a=9.0
	b=8.0
	c=5.0
	echo "$var2 9 8 5" | awk '{if ($1 > $2) touch $2/Awesome/$var1.mp4; else if ($1 > $3) touch $2/Good/$var1.mp4; else if ($1 > $3) touch$2/Average/$var1.mp4; else touch $2/Bad/$var1.mp4;}'
	
done

