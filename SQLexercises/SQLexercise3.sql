.echo on 
.header on

select od.orderid, od.productid, od.unitprice, od.quantity, (od.unitprice * od.quantity) 
as LineTotal, 
(select sum(od3.unitprice * od3.quantity) as OrderTotal 
from order_details od3 where od3.orderid = od.orderid)
as OrderTotal from order_details od limit 10;
