Chapter 4, Subqueries
ISTA-420, T-SQL Fundamentals
--

--Matthew Story

Homework questions

1. In your own words, what is a subquery?

--A subquery is a query that is nested inside another query.

2. In your own words, what is a self contained subquery?

--A self-contained subquery does not have any dependencies on tables from the outer query.

3. In your own words, what is a correlated subquery?

--A correlated subquery is dependent on the tables from the outer query.

4. Give an example of a subquery that returns a single value. When would you use this kind of 
subquery?

  select firstname + ' ' + lastname + ' is Employee of the Month!' as winner
  
  from hr.Employees
  where empid=
  
  (select TOP 1 empid
  from sales.orders
  group by empid
  
  order by count(*) desc);


5. Give an example of a subquery that returns multiple values. When would you use this kind of subquery?

  select firstname + ' ' + lastname + ' had no sales in May, 2016.' as counsel
  
  from hr.Employees
  
  where empid NOT IN
  
  (select empid
  from sales.orders
  where orderdate like '2016-05%');

6. Give an example of a subquery that returns table values. When would you use this kind of 
subquery?

Using the not operator before the exists predicate returns true for each row that isn't returned from the query that follows it. For example, in the following query the not exists predicate returns true if an employee has no orders in May, 2016. 


  select firstname + ' ' + lastname + ' had no sales in May, 2016.' as counsel
  
  from hr.Employees e
  
  where not exists
  
  (select empid
  from sales.orders o
  
  where e.empid=o.empid
  
  and orderdate like '2016-05%');

7. What does the exists predicate do? Give an example.

--The exists predicate, with or without the not operator returns one of two possible values, either true or false. Exists uses two-valued logic and not three-valued logic. If you think about it, there’s no situation where it’s unknown whether a query returns any rows.

8. What happens if we use the not operator before a predicate? Give an example.

--Using the not operator before the exists predicate returns true for each row that isn't returned from the query that follows it. For example, in the following query the not exists predicate returns true if an employee has no orders in May, 2016. 

9. When you use exists or not exists with respect to a row in a database, does it return two or three values? Explain your answer.

--The exists predicate, with or without the not operator returns one of two possible values, either true or false. Exists uses two-valued logic and not three-valued logic. If you think about it, there’s no situation where it’s unknown whether a query returns any rows.

10. How would you a subquery to calculate aggregates? For example, you want to calculate yearly sales of a product, and you also want to keep a running sum of total sales. Explain how you would use a subquery to do this.10. 


  select orderyear as Year, qty as Sales,
  
  (select sum(view2.qty)
  
  from Sales.OrderTotalsByYear as view2
  
  where view2.orderyear <= view1.orderyear) as RunningSales
  
  from Sales.OrderTotalsByYear as view1
  
  order by orderyear;