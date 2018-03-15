Chapter 6, Set operators
--
ISTA-420, T-SQL Fundamentals
--

Homework questions
--
1. What does a set operator do?

--Set operators are operators that combine rows from two query result sets.

2. What are the general requirements of a set operator

--The general requirements of a set operator are, the two input queries must produce results with the same number of columns, and corresponding columns must have compatible data types. Compatible data types means that the data type that is lower in terms of data-type precedence must be implicitly convertible to the higher data type. You can also explicitly convert the data type of a column in one query to the data type of the corresponding column in the other query using the CAST or CONVERT function.

3. What is a Venn Diagram? This is not in the book.

--A Venn diagram (also known as a set diagram or logic diagram) is a diagram that shows all possible logical relations between a finite collection of different sets.

4. Draw a Venn Diagram of the UNION operator. What does it do?

--The UNION operator unifies the results of two input queries. If a row appears in any of the input sets, it will appear in the result of the UNION operator. By default, the results are distinct. 

5. Draw a Venn Diagram of the UNION ALL operator. What does it do?

--The UNION ALL operator unifies the two input query results without attempting to remove duplicates from the result. Assuming that Query1 returns m rows and Query2 returns n rows, Query1 UNION ALL Query2 returns m + n rows. 

6. Draw a Venn Diagram of the INTERSECT operator. What does it do?

--The INTERSECT operator returns only the rows that are common to the results of the two input queries. 

7. If SQL Server supported the INTERSECT ALL operator, what would it do?

--INTERSECT ALL operator means that duplicate intersections will not be removed. INTERSECT ALL returns the number of duplicate rows matching the lower of the counts in both input multisets.

8. Draw a Venn Diagram of the EXCEPT operator. What does it do?

--The EXCEPT operator returns only distinct rows that appear in the first set but not the second. In other words, a row is returned once in the output as long as it appears at least once in the first input multiset and zero times in the second. 

9. If SQL Server supported the EXCEPT ALL operator, what would it do?

--The EXCEPT ALL operator is similar to the EXCEPT operator, but it also takes into account the number of occurrences of each row. If a row R appears x times in the first multiset and y times in the second, and x > y, R will appear x – y times in Query1 EXCEPT ALL Query2. In other words, EXCEPT ALL returns only occurrences of a row from the first multiset that do not have a corresponding occurrence in the second.

10. What is the precedence of the set operators?10. 

--The precedence of the set operators is the INTERSECT operator precedes UNION and EXCEPT, and UNION and EXCEPT are evaluated in order of appearance. Using the ALL variant doesn’t change the precedence.

