# Summary

The purpose of this folder is to hold the files for section two of exercise 1 for MIDS W205. This folder contains three files:



- **hospitals_base.sql** - Creates the hospitals table from base hospital table in Hive


- **procedures_transform.sql** - Creates the procedures table from the base readmissions and timely and effective care tables in Hive. The main transformations that occur in this file are that the two base tables' scores are normalized (by across all like procedures) and scores are transformed such that they are all oriented in the same direction.

Note, from the original effective-care table, two procedures intermediate tables are created, indexed as 0 and 1, and from intermediate_1 file, a final procedures table is created. The nomenclature of the tables should be otherwise self-explanatory  

Essentially, this means that all normalized readmissions scores were inverted by being subtracted from 1; the same transformation was applied to relevant procedures in timely and effective care (measureIDs: 'ED_1b', 'ED_2b', 'EDV', 'OP_1', 'OP_3b', 'OP_5', 'OP_18', 'OP_20', 'OP_21', 'OP_22', 'PC_01'). Finally, only numeric scores were considered in the final procedures table.
- 

**survey_results_final.sql** - Creates the survey results table from the original surveys_responses table in Hive. The survey results are constructed from the Consistency and Base scores as specified in the Survey's documentation (see "HCAHPS and Hospital VBP Scoring" here: http://www.hcahpsonline.org/files/HCAHPS%20Fact%20Sheet%20May%202012.pdf, this is the HCAPS fact sheet version May 2012, Kevin Crook's first video on Exercise 1 also briefly mentions this source).



***REFERENCES: A lot of people held my hand especially in this section. The variable manipulation using DOUBLE and HCAST etc came from KEVIN CROOK video on parquet (second last video in the section on exercise 1 where he talks about transforming date string etc). An ex student from MIDS program whom I frequently consulted for help, practically showed me (held my hand to be accurate) from his work (probably from two years ago) how to form the procedures sql file described above. My original versions were just not working. As you can see, some of the variable manipulations in creating the intermediate tables are pretty elegant, because I have been told how to do this. My contributions to the SQL transform file is just changing the names of the variables and making the whole structure consistent with the table names that I've used etc.