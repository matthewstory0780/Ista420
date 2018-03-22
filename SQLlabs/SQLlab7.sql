.echo on
.headers on

--Matthew Story
--22 March 2018
--SQL lab 7



--1. List the number of orders by each customer who lives in the United States using a CTE. Sort from highest to lowest.

with USAcust as
   (select customerid from customers where country like 'USA')
 select customerid, count(orderid) from orders 
where customerid in USAcust 
 group by customerid order by count(orderid) desc;
 
 --2. List the product name and the number of each product from a German supplier sold to a customer in Germany using a CTE. Sort from highest to lowest.
 
 
 with
GERsup as
 (select s.supplierid from supplies s where s.country like 'Germany'), 
GERcust as
 (select c.customerid from customers c where c.country like 'Germany'),
GERord as 
 (select o.orderid from orders o where o.shipcountry like 'Germany'),
 select p.productid, p.productname, sum(od.quantiy) from products p
 join GERsup on p.supplierid = Gersup.supplierid;