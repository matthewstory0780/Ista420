SQL ch9
--



1. What is a temporal table?

--A type of user table designed to keep a full history of data changes and allow easy point in time analysis. This type of temporal table is referred to as a system-versioned temporal table because the period of validity for each row is managed by the system (i.e. database engine).

2. Under what circumstances would you use a temporal table? Temporal tables are in widespread use in certain kinds of businesses.

-Auditing all data changes and performing data forensics when necessary 

-Reconstructing state of the data as of any time in the past 
Calculating trends over time 

-Maintaining a slowly changing dimension for decision support applications 

-Recovering from accidental data changes and application errors 

3. What are the semantics of a temporal table? There are seven of them.

-CREATE TABLE (Transact-SQL) 

-ALTER TABLE (Transact-SQL) 

-FROM (Transact-SQL) 

4. How do you search a history table?

--You dont.

5. How do you modify a history tablre?

--You update the current table.

6. How do you delete date from a history table? Why would you want to delete data from a history table?

--you dont.

7. How do you search a history table?

--you dont.

8. How do you query all data from both a history ﬁle and the current data?

--'AS OF'

9. How do you drop a temporal table?9. 

--Set system version to off