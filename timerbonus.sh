

for i in `seq 1 $1`
do
	notify-send "$i work"
	sleep 25m
	notify-send "$i break"
	if [ $((i%4))==0 ]; then
		sleep 15m
	fi
	sleep 5m
	
done	
