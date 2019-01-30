cat file*.csv > target_file.csv
echo "age,workclass,fnlwgt,education,education-num,marital-status,occupation,relationship,race,sex,capital-gain,capital-loss,native-country,country" > header.csv
cat header.csv target_file.csv > target_file1.csv
mv target_file1.csv target_file.csv
sed -i 's/?/2018113004/g' target_file.csv
