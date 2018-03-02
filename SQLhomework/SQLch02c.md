--Matthew Story
-- 2/27/2018
-- SQL ch 2c Homework



1. What is a data type? Why we do we have data types

--->SQL Data Type is an attribute that specifies the type of data of any object. Each column, variable and expression has a related data type in SQL. 
  We use them to label information within a SQL database



2. What is a collation? Name four elements of a collation:

--->Collation refers to a set of rules that determine how data is sorted and compared. 
   Examples: Cube, Database, DataItem, Dimension, MiningModel, MiningStructure.


	
3. How would you strip whitespace from string?

--->you set the irrelevant information to a specific value. '...Dave..."

	
4. Write a query for every college and university that is called an institute from the table 'college'

--->select * from table 'college' where name like "institute"


	
5. How would you find out the index of the first space in a string?

--->With the 'Select CHARINDEX (returns 5)' command.
	
6. How to select just the first name from a list of presidents?	

--->select left(name, charindex(‘ ‘, name)) from presidents;


	
7. Payments are due exactly 30 days from the date of the last function. Write a select query that calculates the date of the next payment.
   Pretend we want to update a column in a database that contains the date of the next payment. 
   We will do this when we want to write UPDATE queries.

--->select dateadd(day, 30, orderdate) as nextpayment from orders;
	


8. Suppose your son or daughter wants to run a query every day that tells them the nmber of days until thier 16th birthday.
   Write a select query that does this.

--->(julianday ('now') - julianday ('2018-theirbirthmonth-theirbirthyear')



9. What function returns the current date? 

--->'GETDATE'
	