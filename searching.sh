if [ "$#" -ne 2 ]; then
	echo Error in number of parameters	
	exit 0
else
	pagedata=$(curl -s -L $2)
	echo $pagedata > $2.html
	echo $1
	awk '{gsub(/<[^>]*>/,"\n"); print }' $2.html > $2copy.html
	mv $2copy.html $2.html
	grep -o -i $1 $2.html | wc -l
	rm $2.html
fi

