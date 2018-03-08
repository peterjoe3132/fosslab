#!/bin/bash
#getting the c4b file from site
wget http://14.139.184.212/ask/c4b/c4b.txt


#formatting the text file and removing the lateral entry student entries
sed '1d' c4b.txt>formattemp.txt
sed '62,66d' formattemp.txt>formatted.txt
mv formatted.txt c4b.txt
#first sem to text file
pdftotext -layout result_MDL.pdf results1.txt

#second second sem to text file
pdftotext -layout s2.pdf results2.txt

#removing special characters
#first sem 
tr -d '\014' <results1.txt > temper1.txt
mv temper1.txt results1.txt
#second sem
tr -d '\014' <results2.txt > temper2.txt
mv temper2.txt results2.txt

#getting the CS students from the results of the whole batch
#sem1
grep MDL16CS results1.txt >temp1.txt

paste temp1.txt <(grep CS110\( results1.txt) >temp11.txt

#sem2
grep MDL16CS results2.txt >temp2.txt

paste temp2.txt <(grep CS110\( results2.txt) >temp22.txt


#to create the mark list of C4B
#sem 1
$(join -1 6 -2 1 c4b.txt temp11.txt >final1.txt) 2>/dev/null

#sem2
$(join -1 6 -2 1 c4b.txt temp22.txt >final2.txt) 2>/dev/null

#to get the grades from all the subjects
#sem 1
for i in {2..10}
do
cut -d'(' -f$i final1.txt | cut -d')' -f1 >col1$i.txt
done

#sem 2
for i in {2..10}
do
cut -d'(' -f$i final2.txt | cut -d')' -f1 >col2$i.txt
done

#combining all the grades
#sem 1
paste col1*.txt >grades1.txt

#sem 2
paste col2*.txt >grades2.txt

#replacing grades with marks
#sem 1
sed -i 's/O/10/g' grades1.txt
sed -i 's/A+/9/g' grades1.txt
sed -i 's/A/8.5/g' grades1.txt
sed -i 's/B+/8/g' grades1.txt
sed -i 's/B/7/g' grades1.txt
sed -i 's/C/6/g' grades1.txt
sed -i 's/P/5/g' grades1.txt
sed -i 's/F/0/g' grades1.txt
sed -i 's/FE/0/g' grades1.txt
sed -i 's/I/0/g' grades1.txt

#sem 2 
sed -i 's/O/10/g' grades2.txt
sed -i 's/A+/9/g' grades2.txt
sed -i 's/A/8.5/g' grades2.txt
sed -i 's/B+/8/g' grades2.txt
sed -i 's/B/7/g' grades2.txt
sed -i 's/C/6/g' grades2.txt
sed -i 's/P/5/g' grades2.txt
sed -i 's/F/0/g' grades2.txt
sed -i 's/FE/0/g' grades2.txt
sed -i 's/I/0/g' grades2.txt

#deleting all the unecessary files
#sem 1
rm col1*.txt

#sem 2
rm col2*.txt

#calculating CGPA
#sem 1
cat grades1.txt | while read LINE
do
echo $LINE | awk '{print((($1*4)+($2*4)+($3*3)+($4*3)+($5*3)+($6*3)+($7*1)+($8*1)+($9*1))/23)}' >>test12.txt
done

#sem 2
cat grades2.txt | while read LINE
do
echo $LINE | awk '{print((($1*4)+($2*4)+($3*3)+($4*1)+($5*1)+($6*4)+($7*3)+($8*3)+($9*1))/24)}' >>test22.txt
done


#pasting all the marks
#sem 1
paste test12.txt c4b.txt >sem1.txt
 
#sem 2
paste test22.txt sem1.txt>sem2.txt


#removing the temporary files
rm temp*.txt
rm test*.txt
rm grades*.txt
rm final*.txt
rm results*.txt
rm sem1.txt
rm formattemp.txt

#calculating CGPA
cat sem2.txt | while read LINE1
do
echo $LINE1 | awk '{print((($1*24)+($2*23))/47)}' >>cgpa.txt
done

#containing the required information in a single file ->answer.txt
cut -f 4,5 c4b.txt>tempanswer.txt
paste tempanswer.txt cgpa.txt >answer.txt

#removing the temporary file 
rm sem2.txt
rm temp*.txt
rm cgpa.txt
rm c4b.txt

#to display the final output
cat answer.txt





