Chapter 3, Joins
ISTA-420, T-SQL Fundamentals
---
Matthew Story

6 March 2018

Homework questions


1. In general, why would you even want to join two (or more) tables together? This is a good time to think about the nature of relational algebra.

--You might need to combine information from multiple tables to provide a desired output.

2. Describe in your own words the output from an inner join.

--It applies a Cartesian product between the two input tables like in a cross join, and then it filters rows based on a predicate you specify.

3. Describe in your own words the output from an outer join.

--The result of an outer join is having two kinds of rows with respect to the preserved side. 

4. Describe in your own words the output from an cross join.

--Each row from one input is matched with all rows from the other. So if you have m rows in one table and n rows in the other, you get m x n as the result. 

5. A convenient mnemonic for remembering the various joins is “Ohio.” Why is this true?

--Ohio is bigger in the middle. There is one type of cross join, one type of inner join, but three types of outer joins (left, right, full).

6. Give an example of a composite join.

--Suppose you have a foreign key defined on dbo.Table2, columns col1, col2. referencing dbo.Table1, columns col1, col2 and you need to write a query that joins the two based on this relationship.

FROM dbo.Table1 AS T1

 INNER JOIN dbo.Table2 AS T2.col1
 
 ON T1.col1 = T2 col1
 
 AND T1.col2 =T2.col2

7. What is the diﬀerence between the following two queries? The business problem is “How many orders do we have from each customer?”
================first query=============== SELECT C.custid, COUNT(*) AS numorders FROM Sales.Customers AS C LEFT OUTER JOIN Sales.Orders AS O ON C.custid = O.custid GROUP BY C.custid; ================second query=============== SELECT C.custid, COUNT(O.orderid) AS numorders FROM Sales.Customers AS C LEFT OUTER JOIN Sales.Orders AS O ON C.custid = O.custid GROUP BY C.custid;

--The first query will not provide the desired output because you are counting customers including those who didn't place an order, the second query provides the desired output by counting the actual number of orders from each customer.

8. What might be one reason the following query does not return the column custID in this query?
SELECT C.custid, C.companyname, O.orderid, O.orderdate FROM Sales.Customers AS C LEFT OUTER JOIN Sales.Orders AS O ON C.custid = O.custid WHERE O.orderdate >= ’20160101’;9. 

--Some orders might have had an orderdate on or after ‘20160101’.