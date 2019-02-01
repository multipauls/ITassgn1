exec 2>/dev/null
ls -lar | awk '{print $6, $7, $8, $9}'
ls  /usr/bin | grep ^lo > eg.txt
i=0;
while [ "$i" -le "$(wc -l eg.txt | awk '{print $1}')" ]
do
	x=$(cat eg.txt | head -$i | tail -1)
	echo $x >> 2018113004.txt
	man "$x" | col -b| grep -i -A1 "DESCRIPTION" >> 2018113004.txt
	i=$(( $i + 1 ))
done
rm eg.txt
wc -l 2018113004.txt | awk '{print $1}'
wc -L 2018113004.txt | awk '{print $1}'
cp 2018113004.txt 2018113004backup.txt
sed 's/function/method/g' 2018113004.txt > 2018113004copy.txt
mv 2018113004copy.txt 2018113004.txt


