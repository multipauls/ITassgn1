echo Enter id
read idname
echo Enter new date in dd/mm/yy format
read ndate
echo Enter new time in hh:mm:ss format
read ntime
echo Enter new body
read nbody

len1=$(wc -l remindlist.txt | awk '{print $1}')

for i in `seq 1 $len1`
do
	if [ "$i" -ne "$idname" ]; then
	      head -$i  remindlist.txt | tail -1	>> remindlist2.txt
	else
		echo "$idname $ntime $nbody $ndate" >> remindlist2.txt

	fi
done
mv remindlist2.txt remindlist.txt
