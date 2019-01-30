touch "remindlist.txt"
id1=$(tail -1 remindlist.txt | awk -F'|' '{print $1}')
id1=$(($id1 + 1))

echo "$id1|$1|$2|$3" >> remindlist.txt

hour2=$(echo $1|cut -c 1,2)
min2=$(echo $1|cut -c 4,5)
sec2=$(echo $1|cut -c 7,8)
day2=$(echo $2|cut -c 1,2)
mon2=$(echo $2|cut -c 4,5)
year2=$(echo $2|cut -c 7,8)


hour1=0
min1=0
sec1=0
day1=0
mon1=0
year1=0
 
while [ "$hour1" -ne "$hour2" -o "$min1" -ne "$min2" -o "$sec1" -ne "$sec2" -o "$day1" -ne "$day2" -o "$mon1" -ne "$mon2" -o "$year1" -ne "$year2" ]
do
	hour1=$(date|cut -c 12,13)
	min1=$(date|cut -c 15,16)
	sec1=$(date|cut -c 18,19)
	day1=$(date +%D|cut -c 4,5)
	mon1=$(date +%D|cut -c 1,2)
	year1=$(date +%D|cut -c 7,8)
done
notify-send $3


