#! /bin/bash
#save my current directory

MY_CWD=$(pwd)
#creating staging directories

mkdir ~/staging
mkdir ~/staging/exercise_1
#change to staging directory

cd ~/staging/exercise_1
#get file from data.medicare.gov

MY_URL="https://data.medicare.gov/views/bg9k-emty/files/6c902f45-e28b-42f5-9f96-ae9d1e583472?content_type=application%2Fzip%3B%20charset%3Dbinary&filename=Hospital_Revised_Flatfiles.zip"
wget "$MY_URL" -O medicare_data.zip
#unzip the medicare data

unzip medicare_data.zip
#remove first line of files and rename

OLD_FILE_1="Hospital General Information.csv"
NEW_FILE_1="hospitals.csv"
OLD_FILE_2="Timely and Effective Care - Hospital.csv"
NEW_FILE_2="effective_care.csv"
OLD_FILE_3="Readmissions and Deaths - Hospital.csv"
NEW_FILE_3="readmissions.csv"
OLD_FILE_4="Measure Dates.csv"
NEW_FILE_4="Measures.csv"
OLD_FILE_5="hvbp_hcahps_11_10_2016.csv"
NEW_FILE_5="surveys_responses.csv"
tail -n +2 "$OLD_FILE_1" >$NEW_FILE_1
tail -n +2 "$OLD_FILE_2" >$NEW_FILE_2
tail -n +2 "$OLD_FILE_3" >$NEW_FILE_3
tail -n +2 "$OLD_FILE_4" >$NEW_FILE_4
tail -n +2 "$OLD_FILE_5" >$NEW_FILE_5
#Create our hdfs directory

hdfs dfs -mkdir /user/w205/hospital_compare
#Copy the files to hdfs
hdfs dfs -mkdir /user/w205/hospital_compare/hospitals

hdfs dfs -put $NEW_FILE_1  /user/w205/hospital_compare/hospitals
hdfs dfs -mkdir /user/w205/hospital_compare/effective_care

hdfs dfs -put $NEW_FILE_2  /user/w205/hospital_compare/effective_care
hdfs dfs -mkdir /user/w205/hospital_compare/readmissions

hdfs dfs -put $NEW_FILE_3  /user/w205/hospital_compare/readmissions
hdfs dfs -mkdir /user/w205/hospital_compare/Measures

hdfs dfs -put $NEW_FILE_4  /user/w205/hospital_compare/Measures
hdfs dfs -mkdir /user/w205/hospital_compare/surveys_responses

hdfs dfs -put $NEW_FILE_5  /user/w205/hospital_compare/surveys_responses
#Change the directory back to the original

cd $MY_CWD
#clean exit

exit

