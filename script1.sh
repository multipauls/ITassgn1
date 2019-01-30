ls -lar | awk '{print $6, $7, $8, $9}'
ls  /usr/bin | grep ^lo > 2018113004.txt
wc -l 2018113004.txt | awk '{print $1}'
wc -L 2018113004.txt | awk '{print $1}'
cp 2018113004.txt 2018113004backup.txt
sed 's/function/method/g' 2018113004.txt > 2018113004copy.txt
mv 2018113004copy.txt 2018113004.txt


