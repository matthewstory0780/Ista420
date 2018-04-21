---ch 5 lab SQL

.1
with USAcust as ( select customerid from customers where country like ’USA’ ) 
select o . customerid , count(o . customerid ) as cnt from orders o
 where o . customerid in USAcust 
 group by o . customerid order by cnt desc ; 
 
 2.  with GERprod as ( select s . supplierid , s . country , p. supplierid , p. productid as pid , 
 p. productname from suppliers s join products p on s . supplierid = p. supplierid 8
 where s . country like ’Germany ’ ) ,  GERord as ( select d. productid as pid , d. quantity , d. orderid , o . orderid , o . shipcountry 
 from orders o join order details d on o . orderid = d. orderid 11 where o . shipcountry like ’Germany ’ ) 
 select distinct gp . productname , sum(go . quantity ) as TotalSold from GERprod gp join GERord go  on gp . pid = go . pid
 group by gp . productname order by TotalSold desc 
 
 
 3.WITH EmployeeSubordinatesReport (EmployeeID , LastName , FirstName , NumberOfSubordinates , ReportsTo) AS 
 ( SELECT  EmployeeID , LastName , FirstName , 
 (SELECT COUNT(1) FROM Employees e2 
 WHERE e2 . ReportsTo = e . EmployeeID) as NumberOfSubordinates , ReportsTo 
 FROM Employees e) 
 SELECT Employee . LastName , Employee . FirstName , Employee . NumberOfSubordinates , 
 Manager . LastName as ManagerLastName , Manager . FirstName as ManagerFirstName 
 FROM EmployeeSubordinatesReport Employee  LEFT JOIN EmployeeSubordinatesReport Manager ON 
 Employee . ReportsTo = Manager . EmployeeID order by Employee . NumberOfSubordinates desc ; 
 
 
 4.drop view i f exists CustEmpPairs ; 
 create view CustEmpPairs as with CustEmpPairs ( cid , eid ) as ( 29 select distinct customerid , employeeid from orders )  
 select c . customerid , c . companyname , c . contactname , e . employeeid , e . firstname , e . lastname  
 from customers c , employees e , CustEmpPairs o  where o . eid = e . employeeid and o . cid = c . customerid ;  
 select ∗ from CustEmpPairs where employeeid = 7;  select ∗ from CustEmpPairs where customerid like ’CHOPS’ ;  
 drop view i f exists CustEmpPairs ;

 