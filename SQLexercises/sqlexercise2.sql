.echo on
.headers on 

--name : excersise2
-- Author: Matthew Story
-- Date: march 2nd 2018
 
 select contacttitle || ' ' || contactname || '
 ' || companyname || '
 ' || address || '
 ' || city || ' ' || region || ' ' || postalcode || ' ' || country || '
 ' || '
' || '
' 
 from customers;
