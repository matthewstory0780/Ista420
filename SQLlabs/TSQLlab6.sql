.echo on
.headers on

--Matthew Story 
--CH6 SQL
--March 21st 2018

--1. Create a list of every country where we have either a customer or a supplier.
 select distinct country from suppliers
 union
 select distinct country from customers;
  
 --2. Create a list of every city and country where we have either a customer or a supplier.
 
 select distinct city, country from suppliers
 union
 select distinct city, country from customers;
 
 --3. Create a list of every country where we have both a customer and a supplier.


select c.country, s.country from customers c join suppliers s where s.country = c.country;

--4. Create a list of every city and country where we have both a customer and a supplier.

select city, country from customers 
intersect select city, country from suppliers;

--5. Create a list of every country where we have customers but not suppliers.

select country from customers except select country from suppliers;


--6. Create a list of every country where we have suppliers but not customers.


select country from suppliers except select country from customers;