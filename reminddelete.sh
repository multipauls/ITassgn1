touch remindlist2.txt


len1=$(wc -l remindlist.txt | awk '{print $1}')

for i in `seq 1 $len1`
do
	if [ "$i" -ne "$1" ]; then
	       head -$i remindlist.txt | tail -1	>> remindlist2.txt
	fi
done
mv remindlist2.txt remindlist.txt
