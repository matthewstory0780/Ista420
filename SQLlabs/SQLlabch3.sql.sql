-- .echo on
-- headers on
-- SQLlabch3
-- Author: Matthew Story

--Date: March 7 2018

select e.lastname, e.firstname, o.employeeid, o.orderdate, o.orderid
from orders o join employees e on e.employeeid = o.employeeid;;



select t.territorydescription, t.regionid, r.regionid, r.regiondescription
from region r join territories t on r.regionid = t.regionid
order by r.regiondescription, t.territorydescription;


select s.companyname, p.supplierid, p.productname, p.productid from suppliers s join products p on s.supplierid = p.supplierid 
order by s.companyname, p.productname;


select o.orderdate, o.orderid, od.orderid, od.unitprice, od.quantity, od.productid, p.productid, p.productname
from (orders o, 
join order_details od on o.orderid = od.orderid) 
join products p on p.productid = od.productid
where orderdate = '1998-05-05'
order by o.orderdate; 


select o.orderdate, o.orderid, od.orderid, od.productid, p.productid, p.productname, od.unitprice, od.quantity, od.productid 
from orders o join order_details od on o.orderid = od.orderid, join products p on p.productid = od.productid 
where orderdate = '1998-05-05';





select o.customerid, o.shipcountry, o.employeeid, c.customerid, c.contactname, e.lastname, e.firstname 
from orders o 
join customers c on o.customerid = c.customerid
join employees e on e.employeeid = o.employeeid 
where o.shipcountry like 'France'; 




select p.productid, p.productname, od.productid, od.orderID, o.orderID, o.shipcountry
from order_details od join products p on p.products = od orderID join orders o on orderid = od.orderid
where o.shipcountry like 'Germany';


 select distinct p. productname , o . shipcountry 
 from products p , orders o , order_details d 
 where o . orderid = d. orderid and d. productid = p. productid and o . shipcountry = ’Germany ’ ;
