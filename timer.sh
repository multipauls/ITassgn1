
for i in `seq 1 $1`
do
	echo $i 
	echo work
	sleep 25m
       	if [ $((i%4))==0 ]; then
		sleep 15m
	fi
	echo $i
	echo break
	sleep 5m
done	
