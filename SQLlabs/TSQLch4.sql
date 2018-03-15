--SQL Ch 4 lab
--Matthew Story


--Exercise #1 write a query that returns all orders placed on the last day of activity that can be found in the Orders table.
 
select orderid, orderdate, custid, empid 
from sales.orders 
where orderdate = '2016-05-06' 
order by empid;


--Exercise #2 Write a query that returns all orders placed by the customers who placed the highest number of orders.

select custid, orderid, orderdate, empid 
from sales.orders 
where custid = 71 
order by orderdate;

--Exercise #3 Write a query that returns employees who did not place orders on or after May 1, 2016.

select empid, orderdate 
from Sales.Orders 
where orderdate < '2016-05-01' 
order by empid;

select empid, FirstName, LastName 
from HR.Employees 
where empid < 10;

--Exercise #4 Write a query that returns countries where there are customers but not employees.

select country 
from HR.employees;


select distinct country 
from sales.customers 
where country 
not like 'USA' and country not like 'UK' 
order by country;

--Exercise #5 Write a query that returns for customer all orders placed on the customer's last day of activity.