Chapter 02a, Single Table Queries
ISTA-420, T-SQL Fundamentals
Homework questions
--Matthew Story
--28 Feb 2018



1. What is a primary key constraint? What two other constraints is it equivilent to?
--->Declares a column or combinatin of columns whose values uniquely identify each row in a table.

2. What is a nullability constraint? What does it prevent?
---> is defined by allowing NULL of not NULL values for a column, prevents values in an undefined column.

3. What is a unique constraint? What does it prevent?
--->Defines a set of columns that uniquely identifies rows in a table; prevents duplicates.


4. What is a foreign key constraint? What does it allow?
---> Uniquely identifies a row of same table or another table.


5. What is a check constraint? What does it allow?
--->Specifies a requirement which must be met by each row in a database.


6. What is a default constraint? What does it allow?
--->it allows you to insert a default variable into a column.


7. What is domain integrity? This is not in your text book, but it’s important.
--->Specifies that all columns in a regional database must be declared upon a defined column.


8. What is the diﬀerence between the where and the having clauses? How are they alile?
--->Where clauses cant be used with aggregates, but the having clause can.


9. What SQL operator has the highest precedence? What SQL operator has the lowest precedence?
--->Highest are exponents, lowest is inclusion.


10. Yes or no: In the SQL standard, is NULL equal to NULL? Why or why not?
---> No because NULL is not a placeholder like 0.